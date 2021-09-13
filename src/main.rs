// SPDX-FileCopyrightText: 2021 Rosa Richter
//
// SPDX-License-Identifier: MIT

use std::env;
use serde::Deserialize;
use clap::{App, load_yaml};

#[derive(Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
struct License {
  is_deprecated_license_id: bool,
  name: String,
  license_id: String,
  license_text: Option<String>,
  is_osi_approved: bool,
  see_also: Vec<String>
}

#[derive(Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
struct LicenseList {
  license_list_version: String,
  licenses: Vec<License>
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let args: Vec<String> = env::args().collect();

  let yaml = load_yaml!("cli.yaml");
  let matches = App::from(yaml).get_matches();

  if let Some(ref _matches) = matches.subcommand_matches("ls") {
    let licenses = reqwest::blocking::get("https://spdx.org/licenses/licenses.json")?
         .json::<LicenseList>()?
         .licenses;

    for license in licenses.iter() {
      println!("{} {}", license.license_id, license.name);
    }
  } else {
    let url = format!("https://spdx.org/licenses/{}.json", &args[1]);
    let license = reqwest::blocking::get(url)?
        .json::<License>()?;
    println!("{}", license.license_text.ok_or("No license text")?);
  }

  Ok(())
}
