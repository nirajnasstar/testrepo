$budgetExists = 'No'
$budget = Get-AzConsumptionBudget -ResourceGroupName td-niraj-ps -Name 'DefaultBudget' -ErrorAction SilentlyContinue
if ($budget) {  $budgetExists = 'Yes' } 
else { `
	New-AzResourceGroupDeployment `
   -Name ExampleDeployment `
  -ResourceGroupName td-niraj-ps `
  -TemplateFile "https://raw.githubusercontent.com/nirajnasstar/testrepo/main/budgettemplate.json" `  
} `
Write-Output $budgetExists 
$DeploymentScriptOutputs = @{} 
$DeploymentScriptOutputs['text'] = $budgetExists

