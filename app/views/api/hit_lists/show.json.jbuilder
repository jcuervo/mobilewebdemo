json.agent do |json|
  json.id @agent.id
  json.ag @agent.agent
  json.sm @agent.summary
  json.st @agent.status
end