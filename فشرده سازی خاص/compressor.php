<?php

define("LINE","\n");

$input = readline("Enter your number: ");

$length = strlen($input);
if ($length > 1000 || $length === 0) {
    throw new \Exception("Your number must be between 1 to 1000 chars.");
}
echo compressor($input);

function compressor(string $input)
{
    $map = range(0, 9);
    $values = array_pad([], 10, 0);
    $index = array_combine($map, $values);

    $digits = str_split($input);
    foreach ($digits as $digit) {
        $index[$digit] += 1;
    }

    $non_zero_values = array_filter($index, fn ($v) => $v !== 0);
    $keys = array_keys($non_zero_values);
    $values = array_filter(array_values($non_zero_values), fn ($v) => $v !== 1);
    $combined = array_merge($keys, $values);
    sort($combined, SORT_ASC);

    $result = implode("", $combined);
    if ($result === $input) {
        return $result.LINE;
    } else {
        return compressor($result);
    }
}
