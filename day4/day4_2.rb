# helper function to cnvert a passport item to a map of fields and values

def parser str
    output = {}
    str.split(" ").each do |pair|
        k,v = pair.split(":",2)
        output[k] = v
    end
    output
end

#Field and validation lambdas

def validate_year(string, range_low, range_high)
    string.to_i >= range_low && string.to_i <= range_high
end

ecls = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

passport_fields = {}
passport_fields['byr'] = ->(p) {validate_year(p["byr"],1920,2002)}
passport_fields['iyr'] = ->(p) {validate_year(p["iyr"],2010,2020)}
passport_fields['eyr'] = ->(p) {validate_year(p["eyr"],2020,2030)}
passport_fields['ecl'] = ->(p) {ecls.include?(p["ecl"])}
passport_fields['hcl'] = ->(p) {p["hcl"]&.length == 7 && p["hcl"]&.match(/^\#[0-9a-f]{6}$/)}
passport_fields['hgt'] = ->(p) {p["hgt"]&.match(/^(1([5-8]\d|9[0-3])cm|(59|6\d|7[0-6])in)$/)}
passport_fields['pid'] = ->(p) {p["pid"]&.match(/^\d{9}$/)}

# Main stuff
# parse the file, split into individual passport items, clean up data. 
passports = STDIN.read().split("\n\n").map {|row|row = row.gsub("\n"," ")}

valid = 0
for p in passports do
    checks = true
    
    p = parser(p)                   # parses a passport into hashmap
    
    passport_fields.each do |f,c|   # validate all fields are compliant
        if !passport_fields[f].(p)
            checks = false
            break
        end
    end 
    if checks 
        valid+=1
    end
end

puts "Number of valid Passports: #{valid}"