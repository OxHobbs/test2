# # encoding: utf-8

# Inspec test for recipe test2::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('c:/test.txt') do
  it { should exist }
end
