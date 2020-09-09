---@class GRegex
---GLib Regular Expressions based on PCRE.
---
---Since: 1.11.3
---
---11.14.1.1. Notes
---All functions that take a regular expression pattern as an argument will generate an error if that pattern is found invalid by the regex library.
---
---All functions that take a string-type regex argument accept a compiled regex too. In this case, the compile flags argument is ignored (should be either supplied as nils or omitted).
---
---The capture flag argument cf may also be supplied as a string, whose characters stand for compilation flags. Combinations of the following characters (case sensitive) are supported:
---
---i = G_REGEX_CASELESS - Letters in the pattern match both upper- and lowercase letters. This option can be changed within a pattern by a “(?i)” option setting.
---m = G_REGEX_MULTILINE - By default, GRegex treats the strings as consisting of a single line of characters (even if it actually contains newlines). The “start of line” metacharacter (“^”) matches only at the start of the string, while the “end of line” metacharacter (“$”) matches only at the end of the string, or before a terminating newline (unless G_REGEX_DOLLAR_ENDONLY is set). When G_REGEX_MULTILINE is set, the “start of line” and “end of line” constructs match immediately following or immediately before any newline in the string, respectively, as well as at the very start and end. This can be changed within a pattern by a “(?m)” option setting.
---s = G_REGEX_DOTALL - A dot metacharacter (“.”) in the pattern matches all characters, including newlines. Without it, newlines are excluded. This option can be changed within a pattern by a ("?s") option setting.
---x = G_REGEX_EXTENDED - Whitespace data characters in the pattern are totally ignored except when escaped or inside a character class. Whitespace does not include the VT character (code 11). In addition, characters between an unescaped “#” outside a character class and the next newline character, inclusive, are also ignored. This can be changed within a pattern by a “(?x)” option setting.
---U = G_REGEX_UNGREEDY - Inverts the “greediness” of the quantifiers so that they are not greedy by default, but become greedy if followed by “?”. It can also be set by a “(?U)” option setting within the pattern.
GRegex = {}

---Compiles regular expression pattern into a regular expression object whose internal representation is corresponding to the library used. The returned result then can be used by the methods, e.g. match, exec, etc. Regular expression objects are automatically garbage collected.
---
---Since: 1.11.3
---@param pattern string A Perl-compatible regular expression pattern string
---@return GRegex The compiled regular expression (a userdata object)
---Errors
---
---A malformed pattern generates a Lua error
function GRegex.new(pattern)
end

---Returns a table containing the numeric values of the constants defined by the regex library, with the keys being the (string) names of the constants. If the table argument is supplied then it is used as the output table, otherwise a new table is created. The constants contained in the returned table can then be used in most functions and methods where compilation flags or execution flags can be specified. They can also be used for comparing with return codes of some functions and methods for determining the reason of failure.
---
---Since: 1.11.3
---@param table table optional A table for placing results into
---@return table A table filled with the results.
function GRegex.flags(table)
end

---Returns a table containing the numeric values of the constants defined by the regex library for compile flags, with the keys being the (string) names of the constants. If the table argument is supplied then it is used as the output table, otherwise a new table is created.
---
---Since: 1.11.3
---@param table table optional. A table for placing results into
---@return table A table filled with the results.
function GRegex.compile_flags(table)
end

---Returns a table containing the numeric values of the constants defined by the regex library for match flags, with the keys being the (string) names of the constants. If the table argument is supplied then it is used as the output table, otherwise a new table is created.
---
---Since: 1.11.3
---@param table table optional. A table for placing results into
---@return table A table filled with the results.
function GRegex.match_flags(table)
end

---Searches for the first match of the regexp pattern in the string subject, starting from offset init, subject to flags cf and ef. The pattern is compiled each time this is called, unlike the class method match function.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param pattern string|GRegex A Perl-compatible regular expression pattern string or GRegex object
---@param init number optional. start offset in the subject (can be negative)
---@param cf any optional. compilation flags (bitwise OR)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns all substring matches ("captures"), in the order they appear in the pattern. false is returned for sub-patterns that did not participate in the match. If the pattern specified no captures then the whole matched substring is returned. On failure, returns nil.
function GRegex.match(subject, pattern, init, cf, ef)
end

---Searches for the first match of the regexp pattern in the string subject, starting from offset init, subject to flags ef. The pattern is compiled each time this is called, unlike the class method find function.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param pattern string|GRegex A Perl-compatible regular expression pattern string or GRegex object
---@param init number optional. start offset in the subject (can be negative)
---@param cf any optional. compilation flags (bitwise OR)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns the start point of the match (a number), the end point of the match (a number), and all substring matches ("captures"), in the order they appear in the pattern. false is returned for sub-patterns that did not participate in the match. On failure, returns nil.
function GRegex.find(subject, pattern, init, cf, ef)
end

---Returns an iterator for repeated matching of the pattern patt in the string subj, subject to flags cf and ef. The function is intended for use in the generic for Lua construct. The pattern can be a string or a GRegex object previously compiled with GRegex.new().
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param pattern string|GRegex A Perl-compatible regular expression pattern string or GRegex object
---@param init number optional. start offset in the subject (can be negative)
---@param cf any optional. compilation flags (bitwise OR)
---@param ef any optional. match execution flags (bitwise OR)
---@return any The iterator function is called by Lua. On every iteration (that is, on every match), it returns all captures in the order they appear in the pattern (or the entire match if the pattern specified no captures). The iteration will continue till the subject fails to match.
function GRegex.gmatch(subject, pattern, init, cf, ef)
end

---Searches for all matches of the pattern in the string subject and replaces them according to the parameters repl and max. The pattern can be a string or a GRegex object previously compiled with GRegex.new().
---
---Since: 1.11.3
---
---For details see: https://rrthomas.github.io/lrexlib/manual.html#gsub
---@param subject string Subject string to search
---@param pattern string|GRegex A Perl-compatible regular expression pattern string or GRegex object
---@param repl string|function|table|boolean|nil optional. Substitution source string, function, table, false or nil
---@param max number|function|nil optional. Maximum number of matches to search for, or control function, or nil
---@param cf any optional. Compilation flags (bitwise OR)
---@param ef any optional. Match execution flags (bitwise OR)
---@return any On success, returns the subject string with the substitutions made, the number of matches found, and the number of substitutions made.
function GRegex.gsub(subject, pattern, repl, max, cf, ef)
end

---Splits a subject string subj into parts (sections). The sep parameter is a regular expression pattern representing separators between the sections. The function is intended for use in the generic for Lua construct. The function returns an iterator for repeated matching of the pattern sep in the string subj, subject to flags cf and ef. The sep pattern can be a string or a GRegex object previously compiled with GRegex.new(). Unlike gmatch, there will always be at least one iteration pass, even if there are no matches in the subject.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param sep string|GRegex A Perl-compatible regular expression pattern string or GRegex object
---@param cf any optional. compilation flags (bitwise OR)
---@param ef any optional. match execution flags (bitwise OR)
---@return any The iterator function is called by Lua. On every iteration, it returns a subject section (can be an empty string), followed by all captures in the order they appear in the sep pattern (or the entire match if the sep pattern specified no captures). If there is no match (this can occur only in the last iteration), then nothing is returned after the subject section. The iteration will continue till the end of the subject.
function GRegex.split(subject, sep, cf, ef)
end

---Returns a returns a string containing the version of the used library.
---
---Since: 1.11.3
---@return string The version string
function GRegex.version()
end

---Searches for the first match of the regexp pattern in the string subject, starting from offset init, subject to flags ef.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param init number optional. start offset in the subject (can be negative)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns all substring matches (“captures”), in the order they appear in the pattern. false is returned for sub-patterns that did not participate in the match. If the pattern specified no captures then the whole matched substring is returned. nil is returned if the pattern did not match.
function GRegex:match(subject, init, ef)
end

---Searches for the first match of the regexp pattern in the string subject, starting from offset init, subject to flags ef.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param init number optional. start offset in the subject (can be negative)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns the start point of the match (a number), the end point of the match (a number), and all substring matches ("captures"), in the order they appear in the pattern. false is returned for sub-patterns that did not participate in the match. On failure, returns nil.
function GRegex:find(subject, init, ef)
end

---Searches for the first match of the compiled GRegex object in the string subject, starting from offset init, subject to the execution match flags ef.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param init number optional. start offset in the subject (can be negative)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns the start point of the first match (a number), the end point of the first match (a number), and the offsets of substring matches (“captures” in Lua terminology) are returned as a third result, in a table. This table contains false in the positions where the corresponding sub-pattern did not participate in the match. On failure, returns nil. Example: If the whole match is at offsets 10,20 and substring matches are at offsets 12,14 and 16,19 then the function returns the following: 10, 20, { 12,14,16,19 }.
function GRegex:exec(subject, init, ef)
end

---Matches a compiled regular expression GRegex object against a given subject string subj, using a DFA matching algorithm.
---
---Since: 1.11.3
---@param subject string Subject string to search
---@param init number optional. start offset in the subject (can be negative)
---@param ef any optional. match execution flags (bitwise OR)
---@return any On success, returns the start point of the matches found (a number), a table containing the end points of the matches found, the longer matches first, and the number of matches found as the third return value. On failure, returns nil. Example: If there are 3 matches found starting at offset 10 and ending at offsets 15, 20 and 25 then the function returns the following: 10, { 25,20,15 }, 3
function GRegex:dfa_exec(subject, init, ef)
end

---Returns a string containing debug information about the GRegex object.
---
---Since: 1.11.3
---@return string The debug string
function GRegex:__tostring()
end
