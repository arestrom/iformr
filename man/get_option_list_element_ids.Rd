% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/option_lists.R
\name{get_option_list_element_ids}
\alias{get_option_list_element_ids}
\title{Get list of option_ids for a given element}
\usage{
get_option_list_element_ids(
  server_name,
  profile_id,
  optionlist_id,
  element,
  limit = 1000,
  offset = 0,
  access_token
)
}
\arguments{
\item{server_name}{String of the iFormBuilder server name.}

\item{profile_id}{Integer of the iFormBuilder profile ID}

\item{optionlist_id}{The id number for the option list}

\item{element}{The specific option list element. For example: "key_value".}

\item{limit}{The maximum number of option element ids to return}

\item{offset}{Skips the offset number of options before beginning to return}

\item{access_token}{Access token produced by \code{\link{get_iform_access_token}}}
}
\value{
A dataframe with id and attributes for the selected element.
}
\description{
Sends a request to the iFormBuilder API to get a list of all element ids in
an option list for a specific field. For example: \code{key_value}.
Returns a dataframe with ids and attributes of the specified element.
}
\examples{
\dontrun{
# Get access_token
access_token <- get_iform_access_token(
  server_name = "your_server_name",
  client_key_name = "your_client_key_name",
  client_secret_name = "your_client_secret_name")

# Get the element ids
element_ids <- get_option_list_element_ids(
  server_name = "your_server_name",
  profile_id = 123456,
  optionlist_id = your_option_list_id,
  element = "key_value",
  access_token = access_token)

# Inspect the first five element ids
head(element_ids, 5)
}
}
