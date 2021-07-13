resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'FSN Gym'

-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'


version '1.0.0'

server_scripts {
  'server/main.lua'
}

client_scripts {
  'client/main.lua'
}