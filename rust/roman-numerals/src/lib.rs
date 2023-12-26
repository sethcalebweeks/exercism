use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    digits: Vec<char>,
}

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        let digits = &self.digits;
        let mut roman = String::new();
        for i in 0..digits.len() {
            let digit = digits[i];
            let place = digits.len() - i;
            roman += match place {
                1 => {
                    match digit {
                        '1' => "I",
                        '2' => "II",
                        '3' => "III",
                        '4' => "IV",
                        '5' => "V",
                        '6' => "VI",
                        '7' => "VII",
                        '8' => "VIII",
                        '9' => "IX",
                        _ => "",
                    }
                },
                2 => {
                    match digit {
                        '1' => "X",
                        '2' => "XX",
                        '3' => "XXX",
                        '4' => "XL",
                        '5' => "L",
                        '6' => "LX",
                        '7' => "LXX",
                        '8' => "LXXX",
                        '9' => "XC",
                        _ => "",
                    }
                },
                3 => {
                    match digit {
                        '1' => "C",
                        '2' => "CC",
                        '3' => "CCC",
                        '4' => "CD",
                        '5' => "D",
                        '6' => "DC",
                        '7' => "DCC",
                        '8' => "DCCC",
                        '9' => "CM",
                        _ => "",
                    }
                },
                4 => {
                    match digit {
                        '1' => "M",
                        '2' => "MM",
                        '3' => "MMM",
                        _ => "",
                    }
                },
                _ => "",
            }
        }
        roman.fmt(_f)
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        Roman { 
            digits: num.to_string().chars().collect()
        }
    }
}
