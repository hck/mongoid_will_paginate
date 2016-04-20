require 'mongoid_will_paginate/version'
require 'mongoid_will_paginate/criteria'

Mongoid::Criteria.extend MongoidWillPaginate::Criteria
