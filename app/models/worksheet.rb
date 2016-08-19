class Worksheet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attachments

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

  STATUS = {
    'Open' => 'Open',
    'Closed' => 'Closed',
    'Cancelled' => 'Cancelled'
  }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |piw|
        csv << piw.attributes.values_at(*column_names)
      end
    end
  end
end
