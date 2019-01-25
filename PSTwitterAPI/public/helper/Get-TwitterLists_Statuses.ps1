﻿function Get-TwitterLists_Statuses {
<#
.SYNOPSIS
    Create and manage lists

.DESCRIPTION
    GET lists/statuses
    
    Returns a timeline of tweets authored by members of the specified list. Retweets are included by default. Use the include_rts=false parameter to omit retweets.
    
    Embedded Timelines is a great way to embed list timelines on your website.

.PARAMETER list_id
    The numerical id of the list.

.PARAMETER slug
    You can identify a list by its slug instead of its numerical id. If you decide to do so, note that you'll also have to specify the list owner using the owner_id or owner_screen_name parameters.

.PARAMETER owner_screen_name
    The screen name of the user who owns the list being requested by a slug .

.PARAMETER owner_id
    The user ID of the user who owns the list being requested by a slug .

.PARAMETER since_id
    Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.

.PARAMETER max_id
    Returns results with an ID less than (that is, older than) or equal to the specified ID.

.PARAMETER count
    Specifies the number of results to retrieve per "page."

.PARAMETER include_entities
    Entities are ON by default in API 1.1, each tweet includes a node called "entities". This node offers a variety of metadata about the tweet in a discreet structure, including: user_mentions, urls, and hashtags. You can omit entities from the result by using include_entities=false

.PARAMETER include_rts
    When set to either true , t or 1 , the list timeline will contain native retweets (if they exist) in addition to the standard stream of tweets. The output format of retweeted tweets is identical to the representation you see in home_timeline.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses

#>
    [CmdletBinding()]
    Param(
        [string]$list_id,
        [string]$slug,
        [string]$owner_screen_name,
        [string]$owner_id,
        [string]$since_id,
        [string]$max_id,
        [string]$count,
        [string]$include_entities,
        [string]$include_rts
    )
    Begin {

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

        [string]$Method      = 'GET'
        [string]$Resource    = '/lists/statuses'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/lists/statuses.json'

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Method $Method -ResourceUrl $ResourceUrl -Resource $Resource -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
