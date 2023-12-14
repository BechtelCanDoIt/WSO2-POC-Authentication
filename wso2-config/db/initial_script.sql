-- Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).
-- WSO2 LLC. licenses this file to you under the Apache License,
-- Version 2.0 (the "License"); you may not use this file except
-- in compliance with the License.
-- You may obtain a copy of the License at
-- http://www.apache.org/licenses/LICENSE-2.0
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

-- Set password for WSO2CARBON user
ALTER USER 'WSO2CARBON'@'%' IDENTIFIED BY 'WSO2CARBON_PASSWORD123';

-- Grant privileges to WSO2CARBON user
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT ON *.* TO 'WSO2CARBON'@'%';

-- Create databases
CREATE DATABASE WSO2IDENTITY_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE WSO2SHARED_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE WSO2AM_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Grant privileges on the databases to WSO2CARBON user
GRANT ALL PRIVILEGES ON WSO2IDENTITY_DB.* TO 'WSO2CARBON'@'%';
GRANT ALL PRIVILEGES ON WSO2SHARED_DB.* TO 'WSO2CARBON'@'%';
GRANT ALL PRIVILEGES ON WSO2AM_DB.* TO 'WSO2CARBON'@'%';

-- Apply changes
FLUSH PRIVILEGES;

-- -------------------------------------------------------------------------
