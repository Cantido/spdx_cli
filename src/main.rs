use std::env;
use serde::Deserialize;

#[derive(Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
struct License {
  is_deprecated_license_id: bool,
  name: String,
  license_id: String,
  license_text: String,
  is_osi_approved: bool,
  see_also: Vec<String>
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let args: Vec<String> = env::args().collect();

  let license = &args[1];

  let url = format!("https://spdx.org/licenses/{}.json", license);

  let license = reqwest::blocking::get(url)?
      .json::<License>()?;

  println!("Result: {:?}", license);
  Ok(())
}
