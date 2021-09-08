# SPDX-FileCopyrightText: 2021 Rosa Richter
#
# SPDX-License-Identifier: MIT

defmodule SpdxCli do
  @moduledoc """
  Documentation for `SpdxCli`.
  """

  def main(argv) do
    Optimus.new!(
      name: "spdx",
      description: "Software license tool",
      version: "0.1.0",
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
      ]
    )
    |> Optimus.parse!(argv)
    |> do_command()
  end

  defp do_command(command) do
    license_id = command.args.license
    field = translate_field_name(command.options.field)

    {:ok, _} = HTTPoison.start()

    HTTPoison.get("https://spdx.org/licenses/#{license_id}.json")
    |> case do
      {:ok, response} ->
        Poison.decode!(response.body)[field]
        |> IO.puts()
    end
  end

  defp translate_field_name("text"), do: "licenseText"
  defp translate_field_name("header"), do: "standardLicenseHeader"
  defp translate_field_name("name"), do: "name"
end
