function bat
	set path '/sys/class/power_supply/BAT0'
	set full (eval cat (eval string join '/' $path 'energy_full'))
	set now (eval cat (eval string join '/' $path 'energy_now'))
	set stat (eval math $now/$full)
	set exp (eval string join "\\\\\*" 100 $stat)
	set stat (eval math $exp)
	echo $stat
end

