# Copyright (C)  2022 devloops
# Use of this software is govered by the Business Source License included in the LICENSE.TXT file and at www.mariadb.com/bsl11.
#
# Change Date:
#
# On the date above, in accordance with the Business Source License, use of this software will be governed by the open source license specified in the LICENSE.TXT file.

from conans import ConanFile


class SONDB(ConanFile):
    name = "SONDB"
    settings = "os", "compiler", "build_type", "arch"
    # "jerryscript/2.4.0",
    #  "oatpp/1.3.0", "oatpp-websocket/1.3.0", "oatpp-openssl/1.3.0", "oatpp-libressl/1.3.0",  "oatpp-swagger/1.3.0",
    requires = "geos/3.11.1", "nlohmann_json/3.11.2", "simdjson/3.0.0",  "cryptopp/8.7.0", "openssl/3.0.7", "uwebsockets/20.17.0",'zlib/1.2.13', "date/3.0.1", "zstd/1.5.2", "spdlog/1.11.0", "taocpp-json/1.0.0-beta.13", "taocpp-pegtl/3.2.7"
    generators = ['BazelDeps', 'BazelToolchain']
    # build_requires = "cmake/3.23.2"
    # def build(self):
    #     self.run("cmake --version")
    def configure(self):
        pass
    def imports(self):
        pass
