use std::env;
use serde::Deserialize;

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

  if &args[1] == "ls" {
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
