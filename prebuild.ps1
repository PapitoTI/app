&mkdir -Force lib/src/Generated

foreach ($item in Get-ChildItem -Name "Protos")
{
    #Write-Output [System.IO.Path]::GetFileName($item)
    $str = [System.IO.Path]::GetExtension($item)
    if ($str -ne ".proto") {
        return
    }
    &protoc Protos\$item --dart_out=grpc:lib/src/Generated --proto_path=.
}
