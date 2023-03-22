$budgetExists = 'No' `
$budget = Get-AzConsumptionBudget -ResourceGroupName td-niraj-ps -Name 'DefaultBudget' -ErrorAction SilentlyContinue `
if ($budget) {  $budgetExists = 'Yes' } `
else { `
	New-AzResourceGroupDeployment `
   -Name ExampleDeployment `
  -ResourceGroupName td-niraj-ps `
  -TemplateFile "https://tddevdlkmqn33q5tpu5o.file.core.windows.net/sidkt5iufxmhmazscripts/budgettemplate.json"  
} `
Write-Output $budgetExists ` 
$DeploymentScriptOutputs = @{} ` 
$DeploymentScriptOutputs['text'] = $budgetExists

