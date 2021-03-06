# Import the helper functions

Import-Module $PSScriptRoot\..\..\Misc\helper.psm1 -Verbose:$false
function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$BlockDefinition
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$returnValue = @{
		BlockDefinition = [System.String]
		Category = [System.String]
		AutoOn = [System.String]
		AutoOnHr = [System.UInt16]
		AutoOnMn = [System.UInt16]
		AutoOnSun = [System.String]
		AutoOnMon = [System.String]
		AutoOnTue = [System.String]
		AutoOnWed = [System.String]
		AutoOnThur = [System.String]
		AutoOnFri = [System.String]
		AutoOnSat = [System.String]
		DeepSleepCtrl = [System.String]
		FanSpeed = [System.String]
		FanSpeedLvl = [System.UInt16]
		UsbWake = [System.String]
		FanCtrlOvrd = [System.String]
		AcPwrRcvry = [System.String]
		WakeOnLan = [System.String]
		SfpwakeOnLan = [System.String]
		WakeOnAc = [System.String]
		WakeOnDock = [System.String]
		LidSwitch = [System.String]
		BlinkPowerSupply1LED = [System.String]
		BlinkPowerSupply2LED = [System.String]
		WlanAutoSense = [System.String]
		WwanAutoSense = [System.String]
		BlockSleep = [System.String]
		SleepMode = [System.String]
		PrimaryBattChargeCfg = [System.String]
		CustomChargeStart = [System.UInt16]
		CustomChargeStop = [System.UInt16]
		SliceBattChargeCfg = [System.String]
		ModBattChargeCfg = [System.String]
		DockBatteryChargeConfiguration = [System.String]
		IntlSmartConnect = [System.String]
		IntelReadyModeEn = [System.String]
		PeakShiftCfg = [System.String]
		PeakShiftBatteryThreshold = [System.UInt16]
		PeakShiftDayConfiguration = [System.String]
		StartTime = [System.String]
		EndTime = [System.String]
		ChargeStartTime = [System.String]
		AdvBatteryChargeCfg = [System.String]
		AdvancedBatteryChargeConfiguration = [System.String]
		Type_CBatteryOverloadProtection = [System.String]
		BeginningOfDay = [System.String]
		WorkPeriod = [System.String]		
		Password = [System.String]
		SecurePassword = [System.String]
		PathToKey = [System.String]
	}

	$returnValue
	#>

# Check if module DellBIOSprovider is already loaded. If not, load it.
    try{
        $bool = Confirm-DellPSDrive -verbose
    }
    catch 
    {
        write-Verbose $_
        $msg = "Get-TargetResource: $($_.Exception.Message)"
        Write-DellEventLog -Message $msg -EventID 1 -EntryType 'Error'
        write-Verbose "Exiting Get-TargetResource"
        return
    }
    if ($bool) {                      
        Write-Verbose "Dell PS-Drive DellSmbios is found."
    }
    else{
        $Message = “Get-TargetResource: Module DellBiosProvider was imported correctly."
        Write-DellEventLog -Message $Message -EventID 2 
    }
    
    
    $Get = get-childitem -path @("DellSmbios:\" + $Category)
    # Removing Verbose and Debug from output
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null

    $out = @{}  
    $Get | foreach-Object {$out.Add($_.Attribute, $_.CurrentValue)}
    
    $out.add('Category', $Category )
    $out
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$BlockDefinition,

		[System.String]
		$Category,

		[ValidateSet("EveryDay","Disabled","WeekDays","SelectDays")]
		[System.String]
		$AutoOn,

		[System.UInt16]
		$AutoOnHr,

		[System.UInt16]
		$AutoOnMn,
		
		[System.UInt16]
		$AutoWakePeriod,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSun,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnMon,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnTue,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnWed,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnThur,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnFri,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSat,

		[ValidateSet("Disabled","S5Only","S4AndS5")]
		[System.String]
		$DeepSleepCtrl,

		[ValidateSet("Auto","High","Med","Low","MedHigh","MedLow")]
		[System.String]
		$FanSpeed,

		[System.UInt16]
		$FanSpeedLvl,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$UsbWake,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$FanCtrlOvrd,

		[ValidateSet("Off","On","Last")]
		[System.String]
		$AcPwrRcvry,

		[ValidateSet("AddInCard","Onboard","Disabled","LanOnly","LanWithPxeBoot","WlanOnly","LanWlan")]
		[System.String]
		$WakeOnLan,

		[ValidateSet("SFP","LANSFP","SFPPXE")]
		[System.String]
		$SfpwakeOnLan,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WakeOnAc,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WakeOnDock,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LidSwitch,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply1LED,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply2LED,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WlanAutoSense,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WwanAutoSense,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$BlockSleep,

		[ValidateSet("OSAutomaticSelection","ForceS3")]
		[System.String]
		$SleepMode,

		[ValidateSet("Auto","Standard","Express","PrimAcUse","Custom")]
		[System.String]
		$PrimaryBattChargeCfg,

		[System.UInt16]
		$CustomChargeStart,

		[System.UInt16]
		$CustomChargeStop,

		[ValidateSet("Standard","Express")]
		[System.String]
		$SliceBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$ModBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$DockBatteryChargeConfiguration,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntlSmartConnect,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntelReadyModeEn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PeakShiftCfg,
		
		[ValidateSet("LanOnly","Disabled","LanWithPxeBoot")]
		[System.String]
		$WakeOnLan2,

		[System.UInt16]
		$PeakShiftBatteryThreshold,

		[System.String]
		$PeakShiftDayConfiguration,

		[System.String]
		$StartTime,

		[System.String]
		$EndTime,

		[System.String]
		$ChargeStartTime,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AdvBatteryChargeCfg,

		[System.String]
		$AdvancedBatteryChargeConfiguration,

		[ValidateSet("7.5Watts","15Watts")]
		[System.String]
		$Type_CBatteryOverloadProtection,

		[System.String]
		$BeginningOfDay,

		[System.String]
		$WorkPeriod,
		
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SpeedShift,

		[System.String]
		$Password,

		[System.String]
		$SecurePassword,

		[System.String]
		$PathToKey
	)

    if (-not(CheckModuleLoaded)) {
        Write-Verbose -Message 'Required module DellBiosProvider does not exist. Exiting.'
        return $true
    }

    $DellPSDrive = get-psdrive -name Dellsmbios
    if ( !$DellPSDrive) {
        $Message = "Drive DellSmbios is not found. Exiting."
        Write-Verbose $Message
        Write-DellEventLog -Message $Message -EventID 3 -EntryType "Error"
        return $true
    }

      
    $atts = $PSBoundParameters

    $pathToCategory = $DellPSDrive.Name + ':\' + $atts["Category"]
    
    Dir $pathToCategory -verbose

    $atts.Remove("Verbose") | out-null
    $atts.Remove("Category") | out-null
    $atts.Remove("Debug") | out-null
    $atts.Remove("BlockDefinition") | out-null
    $startTime=$atts['StartTime']
    $endTime=$atts['EndTime']
    $chargeStartTime=$atts['ChargeStartTime']
	$atts.Remove("StartTime") | out-null
	$atts.Remove("EndTime") | out-null
	$atts.Remove("ChargeStartTime") | out-null
    $beginningOfDay=$atts['BeginningOfDay']
    $workPeriod=$atts['WorkPeriod']
    $atts.Remove("BeginningOfDay") | out-null
	$atts.Remove("WorkPeriod") | out-null
	$securePwd=$atts["SecurePassword"]
    $passwordSet=$atts["Password"]
    $atts.Remove("Password") | Out-Null
    $atts.Remove("SecurePassword") | Out-Null
	$pathToKey=$atts["PathToKey"]
	if(-Not [string]::IsNullOrEmpty($pathToKey))
	{  
		if(Test-Path $pathToKey)
		{
		$key=Get-Content $pathToKey
		}
		else
		{
		$key=""
		}
	}
    $atts.Remove("PathToKey") | Out-Null

    $atts.Keys | foreach-object {
					
                    if($($_) -eq "PeakShiftDayConfiguration")
                    {
                     $path = $pathToCategory + '\' + $($_)
                    $value = $atts[$_]
					if(-Not [string]::IsNullOrEmpty($securePwd))
					{                
					$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
					}

					elseif(-Not [string]::IsNullOrEmpty($passwordSet))
					{
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
					}

					else
					{
					Set-Item  -path $path -value $value -StartTime $startTime -EndTime $endTime -ChargeStartTime $chargeStartTime -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
					}
                    
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    }
					
					elseif($($_) -eq "AdvancedBatteryChargeConfiguration")
                    {
                     $path = $pathToCategory + '\' + $($_)
                    $value = $atts[$_]
					
					if(-Not [string]::IsNullOrEmpty($securePwd))
					{                
					$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
					}

					elseif(-Not [string]::IsNullOrEmpty($passwordSet))
					{
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
					}

					else
					{
					Set-Item  -path $path -value $value -BeginningOfDay $beginningOfDay -WorkPeriod $workPeriod -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
					}
					
                    
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    }
					
                     else
                     {
                     $path=""
                        if($($_) -eq "Type_CBatteryOverloadProtection")
                    {
                    $path = $pathToCategory + '\' + "Type-CBatteryOverloadProtection"
                    }					 

                    else
                    {
                    $path = $pathToCategory + '\' + $($_)
                    }
                    $value = $atts[$_]

					if(-Not [string]::IsNullOrEmpty($securePwd))
					{                
					$pasvar=ConvertTo-SecureString $securePwd.ToString() -Key $key
					Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -PasswordSecure $pasvar
					}

					elseif(-Not [string]::IsNullOrEmpty($passwordSet))
					{
					Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue -Password $passwordSet
					}

					else
					{
					Set-Item  -path $path -value $value -verbose -ErrorVariable ev -ErrorAction SilentlyContinue
					}

                    
                    if ( $ev) { 
                        $cmdline = $ExecutionContext.InvokeCommand.ExpandString($ev.InvocationInfo.Line)
                        $Message = "An error occured in executing " + $cmdline + "`nError message: $($ev.ErrorDetails)"
                        Write-Verbose $Message
                        Write-DellEventLog -Message $Message -EventID 5 -EntryType "Error"
                    }
                    }
                 
                 }


}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$BlockDefinition,

		[System.String]
		$Category,

		[ValidateSet("EveryDay","Disabled","WeekDays","SelectDays")]
		[System.String]
		$AutoOn,

		[System.UInt16]
		$AutoOnHr,

		[System.UInt16]
		$AutoOnMn,
		
		[System.UInt16]
		$AutoWakePeriod,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSun,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnMon,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnTue,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnWed,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnThur,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnFri,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AutoOnSat,

		[ValidateSet("Disabled","S5Only","S4AndS5")]
		[System.String]
		$DeepSleepCtrl,

		[ValidateSet("Auto","High","Med","Low","MedHigh","MedLow")]
		[System.String]
		$FanSpeed,

		[System.UInt16]
		$FanSpeedLvl,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$UsbWake,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$FanCtrlOvrd,

		[ValidateSet("Off","On","Last")]
		[System.String]
		$AcPwrRcvry,

		[ValidateSet("AddInCard","Onboard","Disabled","LanOnly","LanWithPxeBoot","WlanOnly","LanWlan")]
		[System.String]
		$WakeOnLan,

		[ValidateSet("SFP","LANSFP","SFPPXE")]
		[System.String]
		$SfpwakeOnLan,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WakeOnAc,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$WakeOnDock,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$LidSwitch,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply1LED,

		[ValidateSet("Enabled")]
		[System.String]
		$BlinkPowerSupply2LED,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WlanAutoSense,

		[ValidateSet("Disabled","Enabled")]
		[System.String]
		$WwanAutoSense,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$BlockSleep,

		[ValidateSet("OSAutomaticSelection","ForceS3")]
		[System.String]
		$SleepMode,

		[ValidateSet("Auto","Standard","Express","PrimAcUse","Custom")]
		[System.String]
		$PrimaryBattChargeCfg,

		[System.UInt16]
		$CustomChargeStart,

		[System.UInt16]
		$CustomChargeStop,

		[ValidateSet("Standard","Express")]
		[System.String]
		$SliceBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$ModBattChargeCfg,

		[ValidateSet("Standard","Express")]
		[System.String]
		$DockBatteryChargeConfiguration,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntlSmartConnect,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$IntelReadyModeEn,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$PeakShiftCfg,

		[System.UInt16]
		$PeakShiftBatteryThreshold,

		[System.String]
		$PeakShiftDayConfiguration,

		[System.String]
		$StartTime,

		[System.String]
		$EndTime,

		[System.String]
		$ChargeStartTime,

		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$AdvBatteryChargeCfg,

		[System.String]
		$AdvancedBatteryChargeConfiguration,

		[ValidateSet("7.5Watts","15Watts")]
		[System.String]
		$Type_CBatteryOverloadProtection,

		[System.String]
		$BeginningOfDay,

		[System.String]
		$WorkPeriod,
				
		[ValidateSet("Enabled","Disabled")]
		[System.String]
		$SpeedShift,
		
		[ValidateSet("LanOnly","Disabled","LanWithPxeBoot")]
		[System.String]
		$WakeOnLan2,

		[System.String]
		$Password,

		[System.String]
		$SecurePassword,

		[System.String]
		$PathToKey
	)

	$Get = Get-TargetResource $PSBoundParameters['Category'] -verbose

    New-DellEventLog
  
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null
    $PSBoundParameters.Remove("Category") | out-null

    $startTime=$PSBoundParameters['StartTime']
    $endTime=$PSBoundParameters['EndTime']
    $chargestartTime=$PSBoundParameters['ChargeStartTime']
	$beginningOfDay=$PSBoundParameters['BeginningOfDay']
	$workPeriod=$PSBoundParameters['WorkPeriod']

    $PSBoundParameters.Remove("StartTime") | out-null
    $PSBoundParameters.Remove("EndTime") | out-null
    $PSBoundParameters.Remove("ChargeStartTime") | out-null
	$PSBoundParameters.Remove("BeginningOfDay") | out-null
	$PSBoundParameters.Remove("WorkPeriod") | out-null
    $PSBoundParameters.Remove("BlockDefinition") | out-null

   $bool = $true

  
   foreach ($config_att in  $PSBoundParameters.GetEnumerator())
   {
    if ($Get.ContainsKey($config_att.Key)) {
    if($config_att.Key -match "PeakShiftDayConfiguration")
    {
    $currentvalue = $Get[$config_att.Key]
    $whichDay=$config_att.Value


    if($whichDay -eq "Monday")
    {
    $iIndex=0
    }

    elseif($whichDay -eq "Tuesday")
    {
    $iIndex=1
    }

    elseif($whichDay -eq "Wednesday")
    {
    $iIndex=2
    }

        elseif($whichDay -eq "Thursday")
    {
    $iIndex=3
    }

        elseif($whichDay -eq "Friday")
    {
    $iIndex=4
    }

        elseif($whichDay -eq "Saturday")
    {
    $iIndex=5
    }

        elseif($whichDay -eq "Sunday")
    {
    $iIndex=6
    }

            if (($currentvalue[$iIndex].StartTime -ne $startTime) -or ($currentvalue[$iIndex].EndTime -ne $endTime) -or ($currentvalue[$iIndex].ChargeStartTime -ne $chargestartTime)){
            $bool = $false
            #$drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
            $drift  = "`nCurrentValue: StartTime "+$currentvalue[$iIndex].StartTime+" EndTime "+$currentvalue[$iIndex].EndTime+" ChargeStartTime "+$currentvalue[$iIndex].ChargeStartTime+"`nDesiredValue: StartTime "+$startTime+" EndTime "+$endTime+" ChargeStartTime "+$chargestartTime
            $message = "Configuration is drifted in category $Category for $($config_att.Key). $drift"
           
            write-verbose $message
            Write-DellEventLog -Message $message -EventID 4 -EntryType Warning
            
        }
        else {
            write-Debug "Configuration is same for $config_att."
        
        }

    }

	elseif($config_att.Key -match "AdvancedBatteryChargeConfiguration")
    {
    $currentvalue = $Get[$config_att.Key]
    $whichDay=$config_att.Value


    if($whichDay -eq "Monday")
    {
    $iIndex=0
    }

    elseif($whichDay -eq "Tuesday")
    {
    $iIndex=1
    }

    elseif($whichDay -eq "Wednesday")
    {
    $iIndex=2
    }

        elseif($whichDay -eq "Thursday")
    {
    $iIndex=3
    }

        elseif($whichDay -eq "Friday")
    {
    $iIndex=4
    }

        elseif($whichDay -eq "Saturday")
    {
    $iIndex=5
    }

        elseif($whichDay -eq "Sunday")
    {
    $iIndex=6
    }

            if (($currentvalue[$iIndex].BeginningOfDay -ne $beginningOfDay) -or ($currentvalue[$iIndex].WorkPeriod -ne $workPeriod)){
            $bool = $false
            #$drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
            $drift  = "`nCurrentValue: BeginningOfDay "+$currentvalue[$iIndex].BeginningOfDay+" WorkPeriod "+$currentvalue[$iIndex].WorkPeriod+"`nDesiredValue: BeginningOfDay "+$beginningOfDay+" WorkPeriod "+$workPeriod
            $message = "Configuration is drifted in category $Category for $($config_att.Key). $drift"
           
            write-verbose $message
            Write-DellEventLog -Message $message -EventID 4 -EntryType Warning
            
        }
        else {
            write-Debug "Configuration is same for $config_att."
        
        }

    }

	
	
    else
    {
     $currentvalue=""
    if($config_att.Key -match "Type_CBatteryOverloadProtection")
    {
    $currentvalue = $Get["Type-CBatteryOverloadProtection"]
    }
    else
    {
        $currentvalue = $Get[$config_att.Key]
    }
        $currentvalue_nospace = $currentvalue -replace " ", ""
        if ($config_att.Value -ne $currentvalue_nospace){
            $bool = $false
            $drift  = "`nCurrentValue: $currentvalue_nospace`nDesiredValue: $($config_att.value)"
            $message = "Configuration is drifted in category $Category for $($config_att.Key). $drift"
           
            write-verbose $message
            Write-DellEventLog -Message $message -EventID 4 -EntryType Warning
            
        }
        else {
            write-Debug "Configuration is same for $config_att."
        
        }
    }

    }
    else {
        $message = "Unsupported attribute $($config_att)."
        Write-Verbose $message
    }
  }
  

   return $bool
}


Export-ModuleMember -Function *-TargetResource


# SIG # Begin signature block
# MIIcOAYJKoZIhvcNAQcCoIIcKTCCHCUCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAobZh4LxqOtTwx
# LOGi1r5SQObPHnLtmViLjo6aWmuPB6CCCscwggUyMIIEGqADAgECAg0Ah4JSYAAA
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
# rjGCEMcwghDDAgEBMIHdMIHIMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVz
# dCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJt
# czE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3Jp
# emVkIHVzZSBvbmx5MTwwOgYDVQQDEzNFbnRydXN0IEV4dGVuZGVkIFZhbGlkYXRp
# b24gQ29kZSBTaWduaW5nIENBIC0gRVZDUzECEHBxdTqSJ2A9AAAAAFVlpdkwDQYJ
# YIZIAWUDBAIBBQCgfDAQBgorBgEEAYI3AgEMMQIwADAZBgkqhkiG9w0BCQMxDAYK
# KwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG
# 9w0BCQQxIgQgWnh2bRld4dZktN+5yOehYZpjE5BkmjizjSSzhTAIfdswDQYJKoZI
# hvcNAQEBBQAEggEAswfH/ONJbE9NLIivLEr9vGbLecVgQuIXJh7OdzXgUZ9RK0f6
# AtqxMt/gY90T3TCwj7QPb4+A5uWNCcc0CV8Z0QQXLP7aeJmO0HQ6x+33WeDJYKjP
# bJBesOkO51GFKpbJkmwLQ3FbK4BdDhpn87C3cqpoTOpZsaPX1vLcPWTTWMdMDUFR
# U6NUm69KSbY69LFn0JVjPidy5t4ugv3SirRdR6jvkMsE3lreio83CXbudhYOuE2s
# NY/Sh0w3qM4m1Ryk8QTuYyyjv4cXeFfi+FLUjqwUHFMrZQMAlu5B/jPT1ihGeTIw
# /nfg395ghKmP0pJs6oWPtjl8V5cygWWBV1HDKKGCDjwwgg44BgorBgEEAYI3AwMB
# MYIOKDCCDiQGCSqGSIb3DQEHAqCCDhUwgg4RAgEDMQ0wCwYJYIZIAWUDBAIBMIIB
# DgYLKoZIhvcNAQkQAQSggf4EgfswgfgCAQEGC2CGSAGG+EUBBxcDMDEwDQYJYIZI
# AWUDBAIBBQAEIBGIy18AnQz4hkDT1w3te8jIo9nltF8as30LHwLWYr/9AhR5Jd3K
# BWtDXykLMz73QayXGVFrJhgPMjAyMDAzMjAxMDA4NDJaMAMCAR6ggYakgYMwgYAx
# CzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0G
# A1UECxMWU3ltYW50ZWMgVHJ1c3QgTmV0d29yazExMC8GA1UEAxMoU3ltYW50ZWMg
# U0hBMjU2IFRpbWVTdGFtcGluZyBTaWduZXIgLSBHM6CCCoswggU4MIIEIKADAgEC
# AhB7BbHUSWhRRPfJidKcGZ0SMA0GCSqGSIb3DQEBCwUAMIG9MQswCQYDVQQGEwJV
# UzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRy
# dXN0IE5ldHdvcmsxOjA4BgNVBAsTMShjKSAyMDA4IFZlcmlTaWduLCBJbmMuIC0g
# Rm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxODA2BgNVBAMTL1ZlcmlTaWduIFVuaXZl
# cnNhbCBSb290IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE2MDExMjAwMDAw
# MFoXDTMxMDExMTIzNTk1OVowdzELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5bWFu
# dGVjIENvcnBvcmF0aW9uMR8wHQYDVQQLExZTeW1hbnRlYyBUcnVzdCBOZXR3b3Jr
# MSgwJgYDVQQDEx9TeW1hbnRlYyBTSEEyNTYgVGltZVN0YW1waW5nIENBMIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu1mdWVVPnYxyXRqBoutV87ABrTxx
# rDKPBWuGmicAMpdqTclkFEspu8LZKbku7GOz4c8/C1aQ+GIbfuumB+Lef15tQDjU
# kQbnQXx5HMvLrRu/2JWR8/DubPitljkuf8EnuHg5xYSl7e2vh47Ojcdt6tKYtTof
# Hjmdw/SaqPSE4cTRfHHGBim0P+SDDSbDewg+TfkKtzNJ/8o71PWym0vhiJka9cDp
# MxTW38eA25Hu/rySV3J39M2ozP4J9ZM3vpWIasXc9LFL1M7oCZFftYR5NYp4rBky
# jyPBMkEbWQ6pPrHM+dYr77fY5NUdbRE6kvaTyZzjSO67Uw7UNpeGeMWhNwIDAQAB
# o4IBdzCCAXMwDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwZgYD
# VR0gBF8wXTBbBgtghkgBhvhFAQcXAzBMMCMGCCsGAQUFBwIBFhdodHRwczovL2Qu
# c3ltY2IuY29tL2NwczAlBggrBgEFBQcCAjAZGhdodHRwczovL2Quc3ltY2IuY29t
# L3JwYTAuBggrBgEFBQcBAQQiMCAwHgYIKwYBBQUHMAGGEmh0dHA6Ly9zLnN5bWNk
# LmNvbTA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vcy5zeW1jYi5jb20vdW5pdmVy
# c2FsLXJvb3QuY3JsMBMGA1UdJQQMMAoGCCsGAQUFBwMIMCgGA1UdEQQhMB+kHTAb
# MRkwFwYDVQQDExBUaW1lU3RhbXAtMjA0OC0zMB0GA1UdDgQWBBSvY9bKo06FcuCn
# vEHzKaI4f4B1YjAfBgNVHSMEGDAWgBS2d/ppSEefUxLVwuoHMnYH0ZcHGTANBgkq
# hkiG9w0BAQsFAAOCAQEAdeqwLdU0GVwyRf4O4dRPpnjBb9fq3dxP86HIgYj3p48V
# 5kApreZd9KLZVmSEcTAq3R5hF2YgVgaYGY1dcfL4l7wJ/RyRR8ni6I0D+8yQL9YK
# bE4z7Na0k8hMkGNIOUAhxN3WbomYPLWYl+ipBrcJyY9TV0GQL+EeTU7cyhB4bEJu
# 8LbF+GFcUvVO9muN90p6vvPN/QPX2fYDqA/jU/cKdezGdS6qZoUEmbf4Blfhxg72
# 6K/a7JsYH6q54zoAv86KlMsB257HOLsPUqvR45QDYApNoP4nbRQy/D+XQOG/mYnb
# 5DkUvdrk08PqK1qzlVhVBH3HmuwjA42FKtL/rqlhgTCCBUswggQzoAMCAQICEHvU
# 5a+6zAc/oQEjBCJBTRIwDQYJKoZIhvcNAQELBQAwdzELMAkGA1UEBhMCVVMxHTAb
# BgNVBAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMR8wHQYDVQQLExZTeW1hbnRlYyBU
# cnVzdCBOZXR3b3JrMSgwJgYDVQQDEx9TeW1hbnRlYyBTSEEyNTYgVGltZVN0YW1w
# aW5nIENBMB4XDTE3MTIyMzAwMDAwMFoXDTI5MDMyMjIzNTk1OVowgYAxCzAJBgNV
# BAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMW
# U3ltYW50ZWMgVHJ1c3QgTmV0d29yazExMC8GA1UEAxMoU3ltYW50ZWMgU0hBMjU2
# IFRpbWVTdGFtcGluZyBTaWduZXIgLSBHMzCCASIwDQYJKoZIhvcNAQEBBQADggEP
# ADCCAQoCggEBAK8Oiqr43L9pe1QXcUcJvY08gfh0FXdnkJz93k4Cnkt29uU2PmXV
# JCBtMPndHYPpPydKM05tForkjUCNIqq+pwsb0ge2PLUaJCj4G3JRPcgJiCYIOvn6
# QyN1R3AMs19bjwgdckhXZU2vAjxA9/TdMjiTP+UspvNZI8uA3hNN+RDJqgoYbFVh
# V9HxAizEtavybCPSnw0PGWythWJp/U6FwYpSMatb2Ml0UuNXbCK/VX9vygarP0q3
# InZl7Ow28paVgSYs/buYqgE4068lQJsJU/ApV4VYXuqFSEEhh+XetNMmsntAU1h5
# jlIxBk2UA0XEzjwD7LcA8joixbRv5e+wipsCAwEAAaOCAccwggHDMAwGA1UdEwEB
# /wQCMAAwZgYDVR0gBF8wXTBbBgtghkgBhvhFAQcXAzBMMCMGCCsGAQUFBwIBFhdo
# dHRwczovL2Quc3ltY2IuY29tL2NwczAlBggrBgEFBQcCAjAZGhdodHRwczovL2Qu
# c3ltY2IuY29tL3JwYTBABgNVHR8EOTA3MDWgM6Axhi9odHRwOi8vdHMtY3JsLndz
# LnN5bWFudGVjLmNvbS9zaGEyNTYtdHNzLWNhLmNybDAWBgNVHSUBAf8EDDAKBggr
# BgEFBQcDCDAOBgNVHQ8BAf8EBAMCB4AwdwYIKwYBBQUHAQEEazBpMCoGCCsGAQUF
# BzABhh5odHRwOi8vdHMtb2NzcC53cy5zeW1hbnRlYy5jb20wOwYIKwYBBQUHMAKG
# L2h0dHA6Ly90cy1haWEud3Muc3ltYW50ZWMuY29tL3NoYTI1Ni10c3MtY2EuY2Vy
# MCgGA1UdEQQhMB+kHTAbMRkwFwYDVQQDExBUaW1lU3RhbXAtMjA0OC02MB0GA1Ud
# DgQWBBSlEwGpn4XMG24WHl87Map5NgB7HTAfBgNVHSMEGDAWgBSvY9bKo06FcuCn
# vEHzKaI4f4B1YjANBgkqhkiG9w0BAQsFAAOCAQEARp6v8LiiX6KZSM+oJ0shzbK5
# pnJwYy/jVSl7OUZO535lBliLvFeKkg0I2BC6NiT6Cnv7O9Niv0qUFeaC24pUbf8o
# /mfPcT/mMwnZolkQ9B5K/mXM3tRr41IpdQBKK6XMy5voqU33tBdZkkHDtz+G5vbA
# f0Q8RlwXWuOkO9VpJtUhfeGAZ35irLdOLhWa5Zwjr1sR6nGpQfkNeTipoQ3PtLHa
# Ppp6xyLFdM3fRwmGxPyRJbIblumFCOjd6nRgbmClVnoNyERY3Ob5SBSe5b/eAL13
# sZgUchQk38cRLB8AP8NLFMZnHMweBqOQX1xUiz7jM1uCD8W3hgJOcZ/pZkU/djGC
# AlowggJWAgEBMIGLMHcxCzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBD
# b3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMgVHJ1c3QgTmV0d29yazEoMCYG
# A1UEAxMfU3ltYW50ZWMgU0hBMjU2IFRpbWVTdGFtcGluZyBDQQIQe9Tlr7rMBz+h
# ASMEIkFNEjALBglghkgBZQMEAgGggaQwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJ
# EAEEMBwGCSqGSIb3DQEJBTEPFw0yMDAzMjAxMDA4NDJaMC8GCSqGSIb3DQEJBDEi
# BCD3EmDx8hCuezF3loazsRPGj/2gpLRxkfJXmbRcuA2SPzA3BgsqhkiG9w0BCRAC
# LzEoMCYwJDAiBCDEdM52AH0COU4NpeTefBTGgPniggE8/vZT7123H99h+DALBgkq
# hkiG9w0BAQEEggEAhBM2RE0hTb56cFyJAkr/ogE0bkZyaGn5ns1B+8DhONOI53Ga
# UATNFVbL07KP4QUPJA6uJo4PoOzXt81HzqlFOC89N2tqx892lCR8yZmTMEB2z3eg
# JkBrMByjkeemv26NlCO6J2fgrybfTvktDHFAFy6ZglwW6r7MSpAb9oY5VGOtoJes
# Kk0OV5QopQXykhuNWeVZBHCHiiyBG3gk1vXyzFbpxEgQSUw7ljRM38fiurs7foy0
# xFRunfJOfLuoGHdPz744UWh4trIF5qK54Fxn6Ovqi63IxfhsTUmLRD65gqBg3G2F
# bwaPTw1756mqUQsUuWGOqUGVglYQyxv8ZJ++tA==
# SIG # End signature block
