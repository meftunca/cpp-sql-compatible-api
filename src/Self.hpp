#pragma once

enum ScopeType {
  View = 0,
  Table ,
  Function ,
  Index,
  Trigger
};

enum BlockType {
  Select = 0,
  Perform,
  Delete,
  Update,
  With,
  Union
};

enum FilterType {
  Eq=0,
  GT,
  GTE,
  LT,
  LTE,
  BTW,
  Like,
  Ilike,
  IN,
  NotIn,
  Any
};