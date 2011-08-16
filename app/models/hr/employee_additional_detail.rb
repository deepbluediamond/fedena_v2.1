# Licensed to the Apache Software Foundation (ASF) under one
#or more contributor license agreements.  See the NOTICE file
#distributed with this work for additional information
#regarding copyright ownership.  The ASF licenses this file
#to you under the Apache License, Version 2.0 (the
#"License"); you may not use this file except in compliance
#with the License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing,
#software distributed under the License is distributed on an
#"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#KIND, either express or implied.  See the License for the
#specific language governing permissions and limitations
#under the License.

class EmployeeAdditionalDetail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :additional_field
  
  def archive_employee_additional_detail(archived_employee)
    additional_detail_attributes = self.attributes
    additional_detail_attributes.delete "id"
    additional_detail_attributes["employee_id"] = archived_employee
    self.delete if ArchivedEmployeeAdditionalDetail.create(additional_detail_attributes)
  end
end
