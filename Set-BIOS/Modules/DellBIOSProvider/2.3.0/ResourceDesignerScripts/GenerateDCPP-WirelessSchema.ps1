﻿<#
This is a Resource designer script which generates a mof schema for DCPP_POSTBehavior resource in DellBIOSProvider module.


#>

$category = New-xDscResourceProperty -name Category -Type String -Attribute Key
$wirelessswitchwwancontrol = New-xDscResourceProperty -name WirelessSwitchWWANControl -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$wirelessswitchbluetoothcontrol = New-xDscResourceProperty -name WirelessSwitchBluetoothControl -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$wirelessswitchwwangpsradiocontrol = New-xDscResourceProperty -name WirelessSwitchWWANGPSRadioControl -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$wirelessswitchwlanwigigcontrol = New-xDscResourceProperty -name WirelessSwitchWLANWiGigControl -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$wirelesswan = New-xDscResourceProperty -name WirelessWAN -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$wirelesslan = New-xDscResourceProperty -name WirelessLAN -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$bluetooth = New-xDscResourceProperty -name Bluetooth -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$Password = New-xDscResourceProperty -Name Password -Type string -Attribute Write -Description "Password"
$SecurePassword = New-xDscResourceProperty -Name SecurePassword -Type string -Attribute Write -Description "SecurePassword"
$PathToKey = New-xDscResourceProperty -Name PathToKey -Type string -Attribute Write



$properties = @($category, $wirelessswitchwwancontrol, $wirelessswitchbluetoothcontrol, $wirelessswitchwwangpsradiocontrol, $wirelessswitchwlanwigigcontrol, $wirelesswan, $wirelesslan, $bluetooth,$Password,$SecurePassword,$PathToKey)

New-xDscResource -ModuleName DellBIOSProviderX86 -Name DCPP_Wireless -Property $properties -Path 'C:\Program Files\WindowsPowerShell\Modules' -FriendlyName "Wireless" -Force -Verbose

# SIG # Begin signature block
# MIIcOQYJKoZIhvcNAQcCoIIcKjCCHCYCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD+xWi/yQK9egXb
# /3l7WF9acdC/NjWhFB9nD8c7vz5fNqCCCscwggUyMIIEGqADAgECAg0Ah4JSYAAA
# AABR03PZMA0GCSqGSIb3DQEBCwUAMIG+MQswCQYDVQQGEwJVUzEWMBQGA1UEChMN
# RW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdh
# bC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMDkgRW50cnVzdCwgSW5jLiAtIGZvciBh
# dXRob3JpemVkIHVzZSBvbmx5MTIwMAYDVQQDEylFbnRydXN0IFJvb3QgQ2VydGlm
# aWNhdGlvbiBBdXRob3JpdHkgLSBHMjAeFw0xNTA2MTAxMzQyNDlaFw0zMDExMTAx
# NDEyNDlaMIHIMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEo
# MCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UE
# CxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBv
# bmx5MTwwOgYDVQQDEzNFbnRydXN0IEV4dGVuZGVkIFZhbGlkYXRpb24gQ29kZSBT
# aWduaW5nIENBIC0gRVZDUzEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDCvTcBUALFjaAu6GYnHZUIy25XB1LW0LrF3euJF8ImXC9xK37LNqRREEd4nmoZ
# NOgdYyPieuOhKrZqae5SsMpnwyjY83cwTpCAZJm/6m9nZRIi25xuAw2oUGH4WMSd
# fTrwgSX/8yoS4WvlTZVFysFX9yAtx4EUgbqYLygPSULr/C9rwM298YzqPvw/sXx9
# d7y4YmgyA7Bj8irPXErEQl+bgis4/tlGm0xfY7c0rFT7mcQBI/vJCZTjO59K4oow
# 56ScK63Cb212E4I7GHJpewOYBUpLm9St3OjXvWjuY96yz/c841SAD/sjrLUyXE5A
# PfhMspUyThqkyEbw3weHuJrvAgMBAAGjggEhMIIBHTAOBgNVHQ8BAf8EBAMCAQYw
# EwYDVR0lBAwwCgYIKwYBBQUHAwMwEgYDVR0TAQH/BAgwBgEB/wIBADAzBggrBgEF
# BQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDAG
# A1UdHwQpMCcwJaAjoCGGH2h0dHA6Ly9jcmwuZW50cnVzdC5uZXQvZzJjYS5jcmww
# OwYDVR0gBDQwMjAwBgRVHSAAMCgwJgYIKwYBBQUHAgEWGmh0dHA6Ly93d3cuZW50
# cnVzdC5uZXQvcnBhMB0GA1UdDgQWBBQqCm8yLCkgIXZqsayMPK+Tjg5rojAfBgNV
# HSMEGDAWgBRqciZ60B7vfec7aVHUbI2fkBJmqzANBgkqhkiG9w0BAQsFAAOCAQEA
# KdkNr2dFXRsJb63MiBD1qi4mF+2Ih6zA+B1TuRAPZTIzazJPXdYdD3h8CVS1WhKH
# X6Q2SwdH0Gdsoipgwl0I3SNgPXkqoBX09XVdIVfA8nFDB6k+YMUZA/l8ub6ARctY
# xthqVO7Or7jUjpA5E3EEXbj8h9UMLM5w7wUcdBAteXZKeFU7SOPId1AdefnWSD/n
# bqvfvZLnJyfAWLO+Q5VvpPzZNgBa+8mM9DieRiaIvILQX30SeuWbL9TEU+XBKdyQ
# +P/h8jqHo+/edtNuajulxlIwHmOrwAlA8cnC8sw41jqy2hVo/IyXdSpYCSziidmE
# CU2X7RYuZTGuuPUtJcF5dDCCBY0wggR1oAMCAQICEHBxdTqSJ2A9AAAAAFVlpdkw
# DQYJKoZIhvcNAQELBQAwgcgxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0
# LCBJbmMuMSgwJgYDVQQLEx9TZWUgd3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1z
# MTkwNwYDVQQLEzAoYykgMjAxNSBFbnRydXN0LCBJbmMuIC0gZm9yIGF1dGhvcml6
# ZWQgdXNlIG9ubHkxPDA6BgNVBAMTM0VudHJ1c3QgRXh0ZW5kZWQgVmFsaWRhdGlv
# biBDb2RlIFNpZ25pbmcgQ0EgLSBFVkNTMTAeFw0xOTEwMTYxOTE5MzhaFw0yMDEy
# MTIxOTQ5MjhaMIHYMQswCQYDVQQGEwJVUzEOMAwGA1UECBMFVGV4YXMxEzARBgNV
# BAcTClJvdW5kIFJvY2sxEzARBgsrBgEEAYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3
# PAIBAhMIRGVsYXdhcmUxETAPBgNVBAoTCERlbGwgSW5jMR0wGwYDVQQPExRQcml2
# YXRlIE9yZ2FuaXphdGlvbjEdMBsGA1UECxMUQ2xpZW50IFByb2R1Y3QgR3JvdXAx
# EDAOBgNVBAUTBzIxNDE1NDExETAPBgNVBAMTCERlbGwgSW5jMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxzH4/Uk7SrrIRybkbZYYU8fiPfIL3ekXg2cQ
# mVhptYD7QNfVbte+R+e8owQqoiBlgkauoRIU3V2aK7FJCgXok0Fl09xMFNmB23Mc
# Hlrsjm6NdjtiocVpd+P8yMjuJt9R5SUrRWr3HWlLyDnK0YiURCTpHOaN6/bb55wT
# eiJItYOgwDblltVN38b1iNN+rrae81ZaA06ofx998NF4Ofoq5NGc3pC3Wk0wCksS
# QpA+koBuuoRrvJkxKDQfGoBmJxexQhziRnDll6DxyQ550fsxmsVcY4LTvgt7pMUF
# xQ4JXAL9QTWLihzgUaW/WIesCmS8dezRP2X5uCL5t9d3w6ERKwIDAQABo4IBXzCC
# AVswDgYDVR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMGoGCCsGAQUF
# BwEBBF4wXDAjBggrBgEFBQcwAYYXaHR0cDovL29jc3AuZW50cnVzdC5uZXQwNQYI
# KwYBBQUHMAKGKWh0dHA6Ly9haWEuZW50cnVzdC5uZXQvZXZjczEtY2hhaW4yNTYu
# Y2VyMDEGA1UdHwQqMCgwJqAkoCKGIGh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvZXZj
# czEuY3JsMEoGA1UdIARDMEEwNgYKYIZIAYb6bAoBAjAoMCYGCCsGAQUFBwIBFhpo
# dHRwOi8vd3d3LmVudHJ1c3QubmV0L3JwYTAHBgVngQwBAzAfBgNVHSMEGDAWgBQq
# Cm8yLCkgIXZqsayMPK+Tjg5rojAdBgNVHQ4EFgQU7+AIvIOh/qMSwsaU6b8HBj+6
# NVYwCQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAQEAPNM/JRouTEuEpxSM/Ihu
# YSFwcj3NmlA2T/9VDre41akRDaAmWEHK19EWN3wb4MPFK1I0f/NjDL+jiX2UZNZj
# A69NCmw7FCaKBPmuVZihPvb4BF1jVuDNQj5GWj5nW3wgIPzduSe6aLzIBO4xsKKb
# Cw0lOtRLzF/UEdqbMx11ns4BMAZeADsT5oKBTjQdJ26njRKZmJA4uc8F649mFqkA
# x0x6PM0alM/+O4xCJ3wXay63Jurr7CiTFXytE+K9jzfPZ6iI2elmx1Eoj4QkcCwX
# ho9KDdn4psSO6kznVjezKdUZU7yEbs4273R0Vr7bWgEqMOfMS7oUpaxJ7OKheVEE
# rjGCEMgwghDEAgEBMIHdMIHIMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVz
# dCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJt
# czE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3Jp
# emVkIHVzZSBvbmx5MTwwOgYDVQQDEzNFbnRydXN0IEV4dGVuZGVkIFZhbGlkYXRp
# b24gQ29kZSBTaWduaW5nIENBIC0gRVZDUzECEHBxdTqSJ2A9AAAAAFVlpdkwDQYJ
# YIZIAWUDBAIBBQCgfDAQBgorBgEEAYI3AgEMMQIwADAZBgkqhkiG9w0BCQMxDAYK
# KwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG
# 9w0BCQQxIgQg+Oke+H9KdkxYk/4/BJzPgs+zGuSLcSCf1UMl2uTM2sUwDQYJKoZI
# hvcNAQEBBQAEggEASdTP7XaWmELabRXlzkTpRCNh/sDcBP6mLakc/xewmjVOCMZo
# d9eyLOGNED7tnBYDK1UI3LNRZ8URk1Ym6v8LAKMyrqgYZT74i1dkJO0NLkUvLv2x
# TwzvowTqBkmDlrYvF9cmlCkIKmE6azqW5vlvvTrjCMoCcYBkKhDrnPmm3E+Vz3QD
# iMt2YuRp7/tpdh2hbJrB2vZM+MmYmJOFAB9/DzcMVh0uCCKd10RAZ++IKaEUJAuY
# SxCwkUKV0d62iyHUoGFDwXqkhsP5Iz02/y+secXvKdOdYOqrZom+TqLMIU4CfCJ7
# +T8w4yak93k7VH+dXwZWsafnyBoAhX4SAwYbZKGCDj0wgg45BgorBgEEAYI3AwMB
# MYIOKTCCDiUGCSqGSIb3DQEHAqCCDhYwgg4SAgEDMQ0wCwYJYIZIAWUDBAIBMIIB
# DwYLKoZIhvcNAQkQAQSggf8EgfwwgfkCAQEGC2CGSAGG+EUBBxcDMDEwDQYJYIZI
# AWUDBAIBBQAEIBzh2eBW4ebuG3FaQg3aqN1ZTXMsJXVFGR5gkOBcQjGRAhUA7CgU
# P4JOelJzhZ/n/S1uS1secg4YDzIwMjAwMzIwMTAwODMwWjADAgEeoIGGpIGDMIGA
# MQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9yYXRpb24xHzAd
# BgNVBAsTFlN5bWFudGVjIFRydXN0IE5ldHdvcmsxMTAvBgNVBAMTKFN5bWFudGVj
# IFNIQTI1NiBUaW1lU3RhbXBpbmcgU2lnbmVyIC0gRzOgggqLMIIFODCCBCCgAwIB
# AgIQewWx1EloUUT3yYnSnBmdEjANBgkqhkiG9w0BAQsFADCBvTELMAkGA1UEBhMC
# VVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBU
# cnVzdCBOZXR3b3JrMTowOAYDVQQLEzEoYykgMjAwOCBWZXJpU2lnbiwgSW5jLiAt
# IEZvciBhdXRob3JpemVkIHVzZSBvbmx5MTgwNgYDVQQDEy9WZXJpU2lnbiBVbml2
# ZXJzYWwgUm9vdCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xNjAxMTIwMDAw
# MDBaFw0zMTAxMTEyMzU5NTlaMHcxCzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1h
# bnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMgVHJ1c3QgTmV0d29y
# azEoMCYGA1UEAxMfU3ltYW50ZWMgU0hBMjU2IFRpbWVTdGFtcGluZyBDQTCCASIw
# DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALtZnVlVT52Mcl0agaLrVfOwAa08
# cawyjwVrhponADKXak3JZBRLKbvC2Sm5Luxjs+HPPwtWkPhiG37rpgfi3n9ebUA4
# 1JEG50F8eRzLy60bv9iVkfPw7mz4rZY5Ln/BJ7h4OcWEpe3tr4eOzo3HberSmLU6
# Hx45ncP0mqj0hOHE0XxxxgYptD/kgw0mw3sIPk35CrczSf/KO9T1sptL4YiZGvXA
# 6TMU1t/HgNuR7v68kldyd/TNqMz+CfWTN76ViGrF3PSxS9TO6AmRX7WEeTWKeKwZ
# Mo8jwTJBG1kOqT6xzPnWK++32OTVHW0ROpL2k8mc40juu1MO1DaXhnjFoTcCAwEA
# AaOCAXcwggFzMA4GA1UdDwEB/wQEAwIBBjASBgNVHRMBAf8ECDAGAQH/AgEAMGYG
# A1UdIARfMF0wWwYLYIZIAYb4RQEHFwMwTDAjBggrBgEFBQcCARYXaHR0cHM6Ly9k
# LnN5bWNiLmNvbS9jcHMwJQYIKwYBBQUHAgIwGRoXaHR0cHM6Ly9kLnN5bWNiLmNv
# bS9ycGEwLgYIKwYBBQUHAQEEIjAgMB4GCCsGAQUFBzABhhJodHRwOi8vcy5zeW1j
# ZC5jb20wNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL3Muc3ltY2IuY29tL3VuaXZl
# cnNhbC1yb290LmNybDATBgNVHSUEDDAKBggrBgEFBQcDCDAoBgNVHREEITAfpB0w
# GzEZMBcGA1UEAxMQVGltZVN0YW1wLTIwNDgtMzAdBgNVHQ4EFgQUr2PWyqNOhXLg
# p7xB8ymiOH+AdWIwHwYDVR0jBBgwFoAUtnf6aUhHn1MS1cLqBzJ2B9GXBxkwDQYJ
# KoZIhvcNAQELBQADggEBAHXqsC3VNBlcMkX+DuHUT6Z4wW/X6t3cT/OhyIGI96eP
# FeZAKa3mXfSi2VZkhHEwKt0eYRdmIFYGmBmNXXHy+Je8Cf0ckUfJ4uiNA/vMkC/W
# CmxOM+zWtJPITJBjSDlAIcTd1m6JmDy1mJfoqQa3CcmPU1dBkC/hHk1O3MoQeGxC
# bvC2xfhhXFL1TvZrjfdKer7zzf0D19n2A6gP41P3CnXsxnUuqmaFBJm3+AZX4cYO
# 9uiv2uybGB+queM6AL/OipTLAduexzi7D1Kr0eOUA2AKTaD+J20UMvw/l0Dhv5mJ
# 2+Q5FL3a5NPD6itas5VYVQR9x5rsIwONhSrS/66pYYEwggVLMIIEM6ADAgECAhB7
# 1OWvuswHP6EBIwQiQU0SMA0GCSqGSIb3DQEBCwUAMHcxCzAJBgNVBAYTAlVTMR0w
# GwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMg
# VHJ1c3QgTmV0d29yazEoMCYGA1UEAxMfU3ltYW50ZWMgU0hBMjU2IFRpbWVTdGFt
# cGluZyBDQTAeFw0xNzEyMjMwMDAwMDBaFw0yOTAzMjIyMzU5NTlaMIGAMQswCQYD
# VQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9yYXRpb24xHzAdBgNVBAsT
# FlN5bWFudGVjIFRydXN0IE5ldHdvcmsxMTAvBgNVBAMTKFN5bWFudGVjIFNIQTI1
# NiBUaW1lU3RhbXBpbmcgU2lnbmVyIC0gRzMwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQCvDoqq+Ny/aXtUF3FHCb2NPIH4dBV3Z5Cc/d5OAp5LdvblNj5l
# 1SQgbTD53R2D6T8nSjNObRaK5I1AjSKqvqcLG9IHtjy1GiQo+BtyUT3ICYgmCDr5
# +kMjdUdwDLNfW48IHXJIV2VNrwI8QPf03TI4kz/lLKbzWSPLgN4TTfkQyaoKGGxV
# YVfR8QIsxLWr8mwj0p8NDxlsrYViaf1OhcGKUjGrW9jJdFLjV2wiv1V/b8oGqz9K
# tyJ2ZezsNvKWlYEmLP27mKoBONOvJUCbCVPwKVeFWF7qhUhBIYfl3rTTJrJ7QFNY
# eY5SMQZNlANFxM48A+y3API6IsW0b+XvsIqbAgMBAAGjggHHMIIBwzAMBgNVHRMB
# Af8EAjAAMGYGA1UdIARfMF0wWwYLYIZIAYb4RQEHFwMwTDAjBggrBgEFBQcCARYX
# aHR0cHM6Ly9kLnN5bWNiLmNvbS9jcHMwJQYIKwYBBQUHAgIwGRoXaHR0cHM6Ly9k
# LnN5bWNiLmNvbS9ycGEwQAYDVR0fBDkwNzA1oDOgMYYvaHR0cDovL3RzLWNybC53
# cy5zeW1hbnRlYy5jb20vc2hhMjU2LXRzcy1jYS5jcmwwFgYDVR0lAQH/BAwwCgYI
# KwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMHcGCCsGAQUFBwEBBGswaTAqBggrBgEF
# BQcwAYYeaHR0cDovL3RzLW9jc3Aud3Muc3ltYW50ZWMuY29tMDsGCCsGAQUFBzAC
# hi9odHRwOi8vdHMtYWlhLndzLnN5bWFudGVjLmNvbS9zaGEyNTYtdHNzLWNhLmNl
# cjAoBgNVHREEITAfpB0wGzEZMBcGA1UEAxMQVGltZVN0YW1wLTIwNDgtNjAdBgNV
# HQ4EFgQUpRMBqZ+FzBtuFh5fOzGqeTYAex0wHwYDVR0jBBgwFoAUr2PWyqNOhXLg
# p7xB8ymiOH+AdWIwDQYJKoZIhvcNAQELBQADggEBAEaer/C4ol+imUjPqCdLIc2y
# uaZycGMv41UpezlGTud+ZQZYi7xXipINCNgQujYk+gp7+zvTYr9KlBXmgtuKVG3/
# KP5nz3E/5jMJ2aJZEPQeSv5lzN7Ua+NSKXUASiulzMub6KlN97QXWZJBw7c/hub2
# wH9EPEZcF1rjpDvVaSbVIX3hgGd+Yqy3Ti4VmuWcI69bEepxqUH5DXk4qaENz7Sx
# 2j6aescixXTN30cJhsT8kSWyG5bphQjo3ep0YG5gpVZ6DchEWNzm+UgUnuW/3gC9
# d7GYFHIUJN/HESwfAD/DSxTGZxzMHgajkF9cVIs+4zNbgg/Ft4YCTnGf6WZFP3Yx
# ggJaMIICVgIBATCBizB3MQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMg
# Q29ycG9yYXRpb24xHzAdBgNVBAsTFlN5bWFudGVjIFRydXN0IE5ldHdvcmsxKDAm
# BgNVBAMTH1N5bWFudGVjIFNIQTI1NiBUaW1lU3RhbXBpbmcgQ0ECEHvU5a+6zAc/
# oQEjBCJBTRIwCwYJYIZIAWUDBAIBoIGkMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0B
# CRABBDAcBgkqhkiG9w0BCQUxDxcNMjAwMzIwMTAwODMwWjAvBgkqhkiG9w0BCQQx
# IgQgVkiUjwmOMHua+ApLniYYKvhaOqJi5EFx0ldHO6rk/PQwNwYLKoZIhvcNAQkQ
# Ai8xKDAmMCQwIgQgxHTOdgB9AjlODaXk3nwUxoD54oIBPP72U+9dtx/fYfgwCwYJ
# KoZIhvcNAQEBBIIBAGD6ecmyXIME4aTvlH1JGvWaz0dqviEIokjbSfSuwPOBT9nz
# AmX9CIq4y9dDpSN5PLfDEiGipNUX2p9zY91NwqSwxlxobWGFCoj+vNANd+ttbLh0
# /mu445uMg+yEsl3UdzZr0TMoJ7DMxu2gI/RDCuTnePaKeIPphcNEj8ctENLkEE3S
# oHVMHFCx9MK0ZULjLLTB24q4y33oTFF3xwVxd0tkxXIZKwZtwL/7LerHLPbUXe/Z
# ajdDMKhpdqVLWMDliKsA7nl+YAXbe4SuzuSD15LAZ3yPRSxLhyTIML3AnWprBBmx
# 1ZoyIGmwCMuxB3/xWZChTNybdPKhHSwMyYdc3rI=
# SIG # End signature block
