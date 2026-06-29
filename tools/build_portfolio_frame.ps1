Add-Type -AssemblyName System.Drawing

$srcDir = "C:\Users\Momina\.cursor\projects\d-portfolio\assets"
$outPath = "D:\portfolio\assets\images\portfolio_frame.jpg"

$patterns = @(
    "*image-c26fecc2*554ad9fd31eb.png",
    "*image-0431c3b0*3e506dbc333d.png"
)

$files = @()
foreach ($pattern in $patterns) {
    $match = Get-ChildItem -Path $srcDir -Filter $pattern -File | Select-Object -First 1
    if (-not $match) {
        throw "Missing source image for pattern: $pattern"
    }
    $files += $match.FullName
}

$canvasW = 1600
$canvasH = 900
$padding = 28
$gap = 18

$bitmap = New-Object System.Drawing.Bitmap $canvasW, $canvasH
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

$graphics.Clear([System.Drawing.Color]::FromArgb(255, 13, 13, 13))

$gold = [System.Drawing.Color]::FromArgb(255, 245, 194, 66)
$goldPen = New-Object System.Drawing.Pen $gold, 3
$graphics.DrawRectangle($goldPen, 4, 4, $canvasW - 8, $canvasH - 8)

$innerX = $padding
$innerY = $padding
$innerW = $canvasW - (2 * $padding)
$innerH = $canvasH - (2 * $padding)
$cellW = [int](($innerW - $gap) / 2)
$cellH = $innerH

function Draw-ImageInCell {
    param(
        [string]$path,
        [int]$col
    )

    $x = $innerX + ($col * ($cellW + $gap))
    $y = $innerY

    $cellBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 22, 22, 22))
    $graphics.FillRectangle($cellBrush, $x, $y, $cellW, $cellH)

    $src = [System.Drawing.Bitmap]::FromFile($path)

    $cropTop = [int]($src.Height * 0.02)
    $cropBottom = [int]($src.Height * 0.02)
    $cropW = $src.Width
    $cropH = $src.Height - $cropTop - $cropBottom

    $destPad = 10
    $destRect = New-Object System.Drawing.Rectangle (
        ($x + $destPad),
        ($y + $destPad),
        ($cellW - (2 * $destPad)),
        ($cellH - (2 * $destPad))
    )
    $srcRect = New-Object System.Drawing.Rectangle 0, $cropTop, $cropW, $cropH

    $graphics.DrawImage($src, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)

    $cellPen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(120, 245, 194, 66)), 1
    $graphics.DrawRectangle($cellPen, $x, $y, $cellW - 1, $cellH - 1)

    $src.Dispose()
    $cellBrush.Dispose()
    $cellPen.Dispose()
}

for ($i = 0; $i -lt $files.Count; $i++) {
    Draw-ImageInCell -path $files[$i] -col $i
}

$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
    Where-Object { $_.MimeType -eq "image/jpeg" }
$encParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$quality = New-Object System.Drawing.Imaging.EncoderParameter (
    [System.Drawing.Imaging.Encoder]::Quality,
    90L
)
$encParams.Param[0] = $quality

$bitmap.Save($outPath, $encoder, $encParams)

$graphics.Dispose()
$bitmap.Dispose()
$goldPen.Dispose()

Write-Host "Created $outPath"
