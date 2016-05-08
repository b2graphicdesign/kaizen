require 'json'
require 'net/http'

class PatientEhrController < ApplicationController

	$access_token = nil

		# change these to your server and credentials
	$Uri = URI.parse('http://twlatestga.unitysandbox.com')

	# Replace "web20" with your Unity application name
	$Appname      = 'KaizenHealth.Kaizen.TestApp'

	# Replace the following with your Unity service credentials
	$Svc_username = 'Kaize-0761-Kaizen-test'
	$Svc_password = 'K@8Z%nH6@LteK@1Z%nTfsT@pPec974'

	# valid PM username, used along with token in each Magic call
	# (see Sandboxes page of developer portal for current values)
	$Ehr_username = 'jmedici'
	$Ehr_password = 'password01'

	def index
		if ($access_token == nil) 
			$access_token = get_token($Svc_username, $Svc_password)
		end
		@access_token = $access_token
	end

	def search
		if (params[:patient_id])
			action = 'GetPatient'
			patient_id = params[:patient_id]
			puts('patient id')
		elsif (params[:last_name])
			action = 'SearchPatients'
			patient_id = nil
			param1 = params[:last_name]
		end

		@json_output = magic_action(action, $Ehr_username, $Appname, patient_id, $access_token, param1)
	end

	def get_token(username, password)
		# build {"Username":"un", "Password":"pw"} string
		json_service_credentials = JSON.generate({:Username => username, :Password => password})

		# send credentials to GetToken endpoint, get token UUID in return
		http = Net::HTTP.new($Uri.host, $Uri.port)
		request = Net::HTTP::Post.new('/Unity/UnityService.svc/json/GetToken', {'Content-Type' => 'application/json'})
		request.body = json_service_credentials
		response = http.request(request)
		unity_token = response.body
		return unity_token
	end

	def magic_action(action, userid, appname, patientid, token, param1='', param2='', param3='', param4='', param5='', param6='', data='')
		# build Magic action JSON string
		my_magic_action = {:Action => action, :AppUserID => userid, :Appname => appname,
			:PatientID => patientid, :Token => token, 
			:Parameter1 => param1, :Parameter2 => param2, :Parameter3 => param3, 
			:Parameter4 => param4, :Parameter5 => param5, :Parameter6 => param6, :Data => data}
		json_magic_action = JSON.generate(my_magic_action)
		
		# post action JSON to MagicJson endpoint, get JSON in return
		http = Net::HTTP.new($Uri.host, $Uri.port)
		request = Net::HTTP::Post.new('/Unity/UnityService.svc/json/MagicJson', {'Content-Type' => 'application/json'})
		request.body = json_magic_action
		response = http.request(request)
		json_output = response.body
		return json_output
	end

end