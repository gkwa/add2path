if($args.count -gt 0) {
    $items = [environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine) + ";" + $args[0]
    $items = $items.Split(";") | Where {$_ -ne ""} | Sort -Unique
    $items = [String]::Join(";", $items)
    [Environment]::SetEnvironmentVariable("Path", $items, [System.EnvironmentVariableTarget]::Machine)
}
