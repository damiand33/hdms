class Worksheet < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  LEVEL = {
    'Low' => 'Low',
    'Medium' => 'Medium',
    'High' => 'High'
  }

  REQUESTED_BY = {
    'Customer' => 'Customer',
    'BEST' => 'BEST'
  }

  PRE_LOAD = {
    'Lorem ipsum' => 'Lorem ipsum',
    'Aliquam tincidunt' => 'Aliquam tincidunt',
    'Vestibulum auctor' => 'Vestibulum auctor'
  }

  MODULE = {
    'Lorem ipsum' => 'Lorem ipsum',
    'Aliquam tincidunt' => 'Aliquam tincidunt',
    'Vestibulum auctor' => 'Vestibulum auctor'
  }

  STAFF = {
    'DER' => 'DER',
    'DER2' => 'DER2',
    'DNT' => 'DNT',
    'DSD' => 'DSD',
    'JHS' => 'JHS',
    'RAC' => 'RAC',
    'WAB' => 'WAB'
  }
end
