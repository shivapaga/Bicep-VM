param location string = resourceGroup().location
param vmName string
param adminUsername string
param adminPassword string

resource vm 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS1_v2'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2019-Datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: '/subscriptions/4d56d29b-e3b4-46d6-88fe-26adb404a6fa/resourceGroups/azure-training/providers/Microsoft.Network/networkInterfaces/virtual-machine-5659511'
        }
      ]
    }
  }
}
