function Get-TwitterStatuses_Retweets_Id {

<#
.SYNOPSIS
    Post, retrieve and engage with Tweets

.DESCRIPTION
    GET statuses/retweets/:id
    
    Returns a collection of the 100 most recent retweets of the Tweet specified by the id parameter.

.PARAMETER id
    The numerical ID of the desired status.

.PARAMETER count
    Specifies the number of records to retrieve. Must be less than or equal to 100.

.PARAMETER trim_user
    When set to either true , t or 1 , each tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-statuses-retweets-id

#>
    [CmdletBinding()]
    Param(
        [string]$id,
        [string]$count,
        [string]$trim_user
    )
    Begin {

        [string]$Method      = 'GET'
        [string]$Resource    = '/statuses/retweets/:id'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/statuses/retweets/:id.json'

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
