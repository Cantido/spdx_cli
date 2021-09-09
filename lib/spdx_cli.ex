# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule SpdxCli do
  @moduledoc """
  Documentation for `SpdxCli`.
  """

  NimbleCSV.define(SpdxParser, [])

  def main(argv) do
    Optimus.new!(
      name: "spdx",
      description: "Software license tool",
      version: "1.2.0",
      author: "Rosa Richter <cosmic.lady.rosa@gmail.com>",
      about: "Utility for searching and using the SPDX software license database",
      allow_unknown_args: false,
      parse_double_dash: true,
      options: [
        field: [
          value_name: "FIELD",
          short: "-f",
          long: "--field",
          help: "Part of the license info to fetch. {text|header|name}",
          default: "text",
          parser: fn arg ->
            if arg in ["text", "header", "name"] do
              {:ok, arg}
            else
              {:error, "Unknown field"}
            end
          end
        ]
      ],
      args: [
        license: [
          name: "LICENSE_ID",
          help: "SPDX identifier of the license."
        ]
      ],
      subcommands: [
        list: [
          name: "ls",
          about: "list the license database",
          options: [
            format: [
              value_name: "FORMAT",
              short: "-f",
              long: "--format",
              help: "The structure of the returned list {text|csv|json}",
              default: "text",
              parser: fn arg ->
                if arg in ["text", "csv", "json"] do
                  {:ok, arg}
                else
                  {:error, "Unknown field"}
                end
              end
            ]
          ]
        ]
      ]
    )
    |> Optimus.parse!(argv)
    |> do_command()
  end

  defp do_command({[:list], command}) do
    {:ok, _} = HTTPoison.start()

    with {:ok, response} when response.status_code == 200 <-
           HTTPoison.get("https://spdx.org/licenses/licenses.json"),
         {:ok, licenses_data} <- Poison.decode(response.body) do
      licenses_data["licenses"] 
      |> format_license_list(command.options.format)
      |> IO.puts()
    else
      {:ok, %HTTPoison.Response{status_code: status}} ->
        IO.puts(:stderr, "Received #{status} response from spdx.org")
        System.stop(2)

      {:error, %HTTPoison.Error{} = e} ->
        IO.puts(:stderr, "Failed to connect to spdx.org: #{Exception.message(e)}")
        System.stop(3)

      {:error, e} ->
        IO.puts(:stderr, "Failed to parse response from spdx.org: #{Exception.message(e)}")
        System.stop(4)
    end
  end

  defp do_command(%Optimus.ParseResult{} = command) do
    license_id = command.args.license
    field = translate_field_name(command.options.field)

    {:ok, _} = HTTPoison.start()

    with {:ok, response} when response.status_code == 200 <-
           HTTPoison.get("https://spdx.org/licenses/#{license_id}.json"),
         {:ok, license_data} <- Poison.decode(response.body) do
      IO.puts(license_data[field])
    else
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts(:stderr, "No license found")
        System.stop(1)

      {:ok, %HTTPoison.Response{status_code: status}} ->
        IO.puts(:stderr, "Received #{status} response from spdx.org")
        System.stop(2)

      {:error, %HTTPoison.Error{} = e} ->
        IO.puts(:stderr, "Failed to connect to spdx.org: #{Exception.message(e)}")
        System.stop(3)

      {:error, e} ->
        IO.puts(:stderr, "Failed to parse response from spdx.org: #{Exception.message(e)}")
        System.stop(4)
    end
  end
  
  defp format_license_list(list, "text") do
    list 
    |> Enum.map(fn license ->
      "#{license["licenseId"]} #{license["name"]}"
    end)
    |> Enum.join("\n")
  end

  defp format_license_list(list, "json") do
    Poison.encode!(list)
  end

  defp format_license_list(list, "csv") do
    headers = Enum.at(list, 0) |> Map.keys() |> Enum.sort()

    list
    |> Enum.map(fn license ->
      # Produce lists that all have the same order
      keys = Map.keys(license) |> Enum.sort()
      Enum.map(keys, fn key ->
        license[key]
      end)
    end)
    |> prepend(headers)
    |> SpdxParser.dump_to_iodata()
    |> IO.iodata_to_binary()
  end

  def prepend(list, item), do: [item | list]

  defp translate_field_name("text"), do: "licenseText"
  defp translate_field_name("header"), do: "standardLicenseHeader"
  defp translate_field_name("name"), do: "name"
end
