import boto3
import json
import base64
import requests

def headers_to_go_style(headers):
    retval = {}
    for k, v in headers.items():
        if isinstance(v, bytes):
            retval[k] = [str(v, 'ascii')]
        else:
            retval[k] = [v]
    return retval

def generate_vault_request(role_name=""):
    session = boto3.session.Session()
    # if you have credentials from non-default sources, call
    # session.set_credentials here, before calling session.create_client
    client = session.client('sts')
    endpoint = client._endpoint
    operation_model = client._service_model.operation_model('GetCallerIdentity')
    request_dict = client._convert_to_request_dict({}, operation_model)
    
    # Vault IAM Server ID Header; not used for this demo
    #awsIamServerId = 'vault.example.com'
    #request_dict['headers']['X-Vault-AWS-IAM-Server-ID'] = awsIamServerId

    request = endpoint.create_request(request_dict, operation_model)
    # It's now signed...
    return {
        'iam_http_request_method': request.method,
        'iam_request_url': str(base64.b64encode(request.url.encode('ascii')), 'ascii'),
        'iam_request_body': str(base64.b64encode(request.body.encode('ascii')), 'ascii'),
        'iam_request_headers': str(base64.b64encode(bytes(json.dumps(headers_to_go_style(dict(request.headers))), 'ascii')), 'ascii'), # It's a CaseInsensitiveDict, which is not JSON-serializable
        'role': role_name,
    }

def lambda_handler(event, context):
    vault_addr = 'http://34.238.82.32:8200'

    vault_iam_auth_request = json.dumps(generate_vault_request('dev-role-iam-lambda'))
    
    response = http.client.HTTPConnection(vault_addr)
    #response = requests.post(vault_addr + "/v1/auth/aws/login", data=vault_iam_auth_request)

    return response.text
