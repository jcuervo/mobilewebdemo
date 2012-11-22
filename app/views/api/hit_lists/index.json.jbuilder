json.agents @hit_lists do |json, agent|
  json.id agent.id
  json.ag agent.agent
  json.st agent.status
end