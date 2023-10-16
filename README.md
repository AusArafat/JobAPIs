# README

## Task difficulties
Due to time constraint no proper authentication or testing modules were created.  
I opted for simple bearer user authentication which has many flaws. Attempting to use Devise library caused some issues.  
Testing was done during development manually, and I had no time left to create proper unit tests for endpoints and validations.  
Due to this, there is a high likelyhood that some cases were missed and will throw errors.  
No proper classes were created for error handling and message structures.  
To unify the response behvaiour of the various endpoints.

Given all these difficulties I have done my best to fulfill the technical requirements and learn as I go during my
first ruby experience.

## Users
### There are 2 default users created 
* aus_admin@example.com
* ausn@example.com

Both with password "123456789"

### Login can be reached via Posting to '/auth/login' endpoint which accepts

```json
{
  "email" : "aus@example.com",
  "password" : "123456789"
}
```

### New user creation can be achieved via Posting to '/auth/register' which accepts
```json
{
    "email" : "",
    "password" : ""
}
```

## Jobs

### Get all & Get by id can be reached using
* Get to '/jobs'
* Get to '/jobs/{id}'

### Creating new job can be done by Posting to '/jobs' which accepts
```json
{
    "job" : {
        "JobName" : "Test",
        "JobDescription" : "Test"
    }
}
```

### Job Creating or Deletion was not implemented but should be trivial

## Job Applications

### Get all & Get by id can be reached using
* Get to '/job_applications'
* Get to '//job_applications/{id}'

### Job application can be created by Posting to '/job_applications'
```json
{
    "job_application": {
        "job_id": "1"
    }
}
```