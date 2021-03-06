% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/option_lists.R
\name{update_options_in_list}
\alias{update_options_in_list}
\title{Update values in an existing option list}
\usage{
update_options_in_list(
  server_name,
  profile_id,
  optionlist_id,
  option_values,
  fields = "fields",
  limit = 1000,
  offset = 0,
  access_token = access_token
)
}
\arguments{
\item{server_name}{String of the iFormBuilder server name}

\item{profile_id}{Integer of the iFormBuilder profile ID}

\item{optionlist_id}{The id number for the option list}

\item{option_values}{A json object containing new option list values}

\item{fields}{Placeholder for fields to update, not yet implemented}

\item{limit}{The maximum number of option list items to return}

\item{offset}{Skips the offset number of options before beginning to update}

\item{access_token}{Access token produced by \code{\link{get_iform_access_token}}}
}
\value{
A vector of option ids for elements that were updated
}
\description{
Sends a request to the iFormBuilder API to update existing values in an
option list. Option values for the specified fields will be updated to the
new values supplied in the json object `option_values`. Do not use the fields
parameter. It has not been implemented yet.
}
\examples{
\dontrun{
# Get access_token
access_token <- get_iform_access_token(
  server_name = "your_server_name",
  client_key_name = "your_client_key_name",
  client_secret_name = "your_client_secret_name")

# Get the core elements in the locations option list example.
core_elements <- get_core_option_list_elements(
  server_name = "your_server_name",
  profile_id = 123456,
  optionlist_id = your_locations_option_list_id,
  access_token = access_token)

# Inspect the first five core elements
head(core_elements, 5)

# Edit two of the core_elements we pulled above.
updated_options = core_elements[3:4,]
updated_options

# Edit. Assume RMs were incorrect.
updated_options$label[1] = "RM 0.20"
updated_options$label[2] = "RM 1.80"

# Convert location list dataframe to json
updated_options_json <- jsonlite::toJSON(updated_options, auto_unbox = TRUE)

# Send request
updated_ids <- update_options_in_list(
  server_name = "wdfw",
  profile_id = 417763,
  optionlist_id = your_locations_option_list_id,
  option_values = updated_options_json,
  access_token = access_token)

# Inspect the updated option list item ids.
updated_ids
}
}
