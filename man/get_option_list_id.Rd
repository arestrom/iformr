% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/option_lists.R
\name{get_option_list_id}
\alias{get_option_list_id}
\title{Get the id of a single option list given an option list name}
\usage{
get_option_list_id(
  server_name,
  profile_id,
  option_list_name,
  limit = 1000,
  offset = 0,
  access_token
)
}
\arguments{
\item{server_name}{String of the iFormBuilder server name}

\item{profile_id}{Integer of the iFormBuilder profile ID}

\item{option_list_name}{The name of the option list}

\item{limit}{The maximum number of option lists to return}

\item{offset}{Skips the offset number of options before beginning to return}

\item{access_token}{Access token produced by \code{\link{get_iform_access_token}}}
}
\value{
A listing of all option lists in the given profile
}
\description{
Sends a request to the iFormBuilder API to get the id number for a single
option list. You only need to supply the name of the option list.
}
\examples{
\dontrun{
# Get access_token
access_token <- get_iform_access_token(
  server_name = "your_server_name",
  client_key_name = "your_client_key_name",
  client_secret_name = "your_client_secret_name")

# Get the id of a single option list given the name
streams_option_list_id <- get_option_list_id(
  server_name = "your_server_name",
  profile_id = 123456,
  option_list_name = "SGS-Streams",
  access_token = access_token)
}
}
