use std::collections::HashSet;

pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {
    let mut sieve = HashSet::new();
    let mut primes = Vec::new();
    for i in 2..=upper_bound {
        sieve.insert(i);
    }
    for i in 2..=upper_bound {
        if sieve.contains(&i) {
            primes.push(i);
            for j in (i * i..=upper_bound).step_by(i as usize) {
                sieve.remove(&j);
            }
        }
    }
    primes
}
