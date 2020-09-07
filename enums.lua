---@class Ftype
ftypes = {
    ---@type Ftype
    NONE = FT_NONE,
    ---@type Ftype
    BOOLEAN = FT_BOOLEAN,
    ---@type Ftype
    CHAR = FT_CHAR,
    ---@type Ftype
    UINT8 = FT_UINT8,
    ---@type Ftype
    UINT16 = FT_UINT16,
    ---@type Ftype
    UINT24 = FT_UINT24,
    ---@type Ftype
    UINT32 = FT_UINT32,
    ---@type Ftype
    UINT64 = FT_UINT64,
    ---@type Ftype
    INT8 = FT_INT8,
    ---@type Ftype
    INT16 = FT_INT16,
    ---@type Ftype
    INT24 = FT_INT24,
    ---@type Ftype
    INT32 = FT_INT32,
    ---@type Ftype
    INT64 = FT_INT64,
    ---@type Ftype
    FLOAT = FT_FLOAT,
    ---@type Ftype
    DOUBLE = FT_DOUBLE,
    ---@type Ftype
    ABSOLUTE_TIME = FT_ABSOLUTE_TIME,
    ---@type Ftype
    RELATIVE_TIME = FT_RELATIVE_TIME,
    ---@type Ftype
    STRING = FT_STRING,
    ---@type Ftype
    STRINGZ = FT_STRINGZ,
    ---@type Ftype
    ETHER = FT_ETHER,
    ---@type Ftype
    BYTES = FT_BYTES,
    ---@type Ftype
    UINT_BYTES = FT_UINT_BYTES,
    ---@type Ftype
    IPv4 = FT_IPv4,
    ---@type Ftype
    IPv6 = FT_IPv6,
    ---@type Ftype
    IPXNET = FT_IPXNET,
    ---@type Ftype
    FRAMENUM = FT_FRAMENUM,
    ---@type Ftype
    GUID = FT_GUID,
    ---@type Ftype
    OID = FT_OID,
    ---@type Ftype
    SYSTEM_ID = FT_SYSTEM_ID,
    ---@type Ftype
    REL_OID = FT_REL_OID,
    ---@type Ftype
    EUI64 = FT_EUI64,
    ---@type Ftype
    FCWWN = FT_FCWWN,
}

---@class Base
base = {
    ---@type Base
    NONE = BASE_NONE,
    ---@type Base
    DEC = BASE_DEC,
    ---@type Base
    HEX = BASE_HEX,
    ---@type Base
    OCT = BASE_OCT,
    ---@type Base
    DEC_HEX = BASE_DEC_HEX,
    ---@type Base
    HEX_DEC = BASE_HEX_DEC,
    ---@type Base
    UNIT_STRING = BASE_UNIT_STRING,
    ---@type Base
    ASCII = STR_ASCII,
    ---@type Base
    UNICODE = STR_UNICODE,
    ---@type Base
    DOT = SEP_DOT,
    ---@type Base
    DASH = SEP_DASH,
    ---@type Base
    COLON = SEP_COLON,
    ---@type Base
    SPACE = SEP_SPACE,
    ---@type Base
    LOCAL = ABSOLUTE_TIME_LOCAL,
    ---@type Base
    UTC = ABSOLUTE_TIME_UTC,
    ---@type Base
    DOY_UTC = ABSOLUTE_TIME_DOY_UTC,
    ---@type Base
    LOCAL = ABSOLUTE_TIME_LOCAL,
    ---@type Base
    UTC = ABSOLUTE_TIME_UTC,
    ---@type Base
    DOY_UTC = ABSOLUTE_TIME_DOY_UTC,
}
