


#Define Variables 

$ResourceGroupName = "RG-IMLABS-DEMO-BASTION"
$subnetName = "AzureBastionSubnet"
$VnetName = "VNET-IMLABS-DEMO-BASTION"
$Location = "WestEurope"
$PublicIpName = "PIP-IMLABS-DEMO-BASTION"
$BastionName = "BAS-IMLABS-DEMO-BASTION"
$PublicIpSku = "Standard"

#DeployResources 

New-AzResourceGroup -Name $ResourceGroupName -Location 'westeurope'
$subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 10.0.0.0/24
$Vnet = New-AzVirtualNetwork -Name $VnetName -ResourceGroupName $ResourceGroupName -Location $Location -AddressPrefix 10.0.0.0/16 -Subnet $subnet
$publicip = New-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -name $PublicIpName -location $Location -AllocationMethod Static -Sku $PublicIpSku
New-AzBastion -ResourceGroupName $ResourceGroupName -Name $BastionName -PublicIpAddress $publicip -VirtualNetwork $Vnet