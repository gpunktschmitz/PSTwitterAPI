function Get-TwitterStatuses_RetweetsOfMe {

<#
.SYNOPSIS
    Post, retrieve and engage with Tweets

.DESCRIPTION
    GET statuses/retweets_of_me
    
    Returns the most recent Tweets authored by the authenticating user that have been retweeted by others. This timeline is a subset of the user's GET statuses / user_timeline.

.PARAMETER count
    Specifies the number of records to retrieve. Must be less than or equal to 100. If omitted, 20 will be assumed.

.PARAMETER since_id
    Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.

.PARAMETER max_id
    Returns results with an ID less than (that is, older than) or equal to the specified ID.

.PARAMETER trim_user
    When set to either true , t or 1 , each tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.

.PARAMETER include_entities
    The tweet entities node will not be included when set to false .

.PARAMETER include_user_entities
    The user entities node will not be included when set to false .

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-statuses-retweets_of_me

#>
    [CmdletBinding()]
    Param(
        [string]$count,
        [string]$since_id,
        [string]$max_id,
        [string]$trim_user,
        [string]$include_entities,
        [string]$include_user_entities
    )
    Begin {

        [string]$Method      = 'GET'
        [string]$Resource    = '/statuses/retweets_of_me'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/statuses/retweets_of_me.json'

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | % { $Parameters.Remove($_) }

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Resource $Resource -Method $Method -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
