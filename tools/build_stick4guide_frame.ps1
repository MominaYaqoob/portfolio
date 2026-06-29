Add-Type -AssemblyName System.Drawing

$srcDir = "C:\Users\Momina\.cursor\projects\d-portfolio\assets"
$outPath = "D:\portfolio\assets\images\stick4guide_frame.jpg"

$patterns = @(
    "*image-0a3464c5*de46dac7b5d7.png",
    "*image-a952c769*38f1a462005f.png",
    "*image-ba0a34fa*3df1d9d9dba5.png",
    "*image-37fad350*b7bfef83509f.png"
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

$bgColor = [System.Drawing.Color]::FromArgb(255, 13, 13, 13)
$graphics.Clear($bgColor)

$gold = [System.Drawing.Color]::FromArgb(255, 245, 194, 66)
$goldPen = New-Object System.Drawing.Pen $gold, 3
$graphics.DrawRectangle($goldPen, 4, 4, $canvasW - 8, $canvasH - 8)

$innerX = $padding
$innerY = $padding
$innerW = $canvasW - (2 * $padding)
$innerH = $canvasH - (2 * $padding)
$cellW = [int](($innerW - $gap) / 2)
$cellH = [int](($innerH - $gap) / 2)

function Draw-ImageInCell {
    param(
        [string]$path,
        [int]$col,
        [int]$row
    )

    $x = $innerX + ($col * ($cellW + $gap))
    $y = $innerY + ($row * ($cellH + $gap))

    $cellBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 22, 22, 22))
    $graphics.FillRectangle($cellBrush, $x, $y, $cellW, $cellH)

    $src = [System.Drawing.Bitmap]::FromFile($path)

    $cropTop = [int]($src.Height * 0.05)
    $cropRight = [int]($src.Width * 0.10)
    $cropW = $src.Width - $cropRight
    $cropH = $src.Height - $cropTop

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
    $col = $i % 2
    $row = [math]::Floor($i / 2)
    Draw-ImageInCell -path $files[$i] -col $col -row $row
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
$bgBrush = $null

Write-Host "Created $outPath"
