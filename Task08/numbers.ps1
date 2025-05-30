function Show-Date_Info {
    $date = Get-Date
    $day = $date.Day
    $month = $date.Month
    $year = $date.Year

    Write-Host "Today is: $($date.ToString("dd.MM.yyyy"))"

    function Get-Fact($number) {
        $url = "http://numbersapi.com/$number/math"
        try {
            $fact = Invoke-RestMethod -Uri $url
            return $fact
        } catch {
            return "No one cool fact about $number, sorry("
        }
    }

    Write-Host (Get-Fact $day)
    Write-Host (Get-Fact $month)
    Write-Host (Get-Fact $year)
}
