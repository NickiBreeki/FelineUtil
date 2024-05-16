local Package = script.Parent
local main = {}
function module:import(serviceName)
	assert(
    Package.Services:FindFirstChild(serviceName),
    ('\n\n[%s]: Invalid Service, "%s" not found in %s.Services')
    :format(Package.Name, serviceName, Package.Name)
  )
	
	return require(Package.Services[serviceName])
end
return main
