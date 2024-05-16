-- // MODULE.FELINEUTIL.SERVICES.THREADS

local _Thread = {}

-- // USAGES
function _Thread.new(Interval, Function)
	local newBranch = {}
	newBranch.Code = Function
	newBranch.Elapsed = 0
	newBranch.Interval = Interval or 0.5
	newBranch.Running = Instance.new("BoolValue")
	
	function newBranch:Loop()
		task.spawn(function()
			newBranch.Start = tick()
			
			repeat
				task.wait(newBranch.Interval)
				
				if newBranch.Code then
					newBranch.Code()
				end
				
				newBranch.Elapsed = tick() - newBranch.Start
			until not newBranch.Running.Value
		end)
	end
	
	function newBranch:Run()
		if not self.Running.Value then
			self.Running.Value = true
			self.Loop()
		end
	end
	function newBranch:Stop()
		self.Running.Value = false
	end
	
	return newBranch
end

return _Thread