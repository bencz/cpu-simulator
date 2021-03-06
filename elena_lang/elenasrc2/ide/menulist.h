//---------------------------------------------------------------------------
//		E L E N A   P r o j e c t:  ELENA IDE
//      MenuList class header
//                                              (C)2005-2015, by Alexei Rakov
//---------------------------------------------------------------------------

#ifndef menulistH
#define menulistH

#include "ide.h"

namespace _GUI_
{

// --- MenuHistoryList ---

class MenuHistoryList
{
protected:
   int    _maxCount;

   Menu*  _menu;
   int    _menuBaseId;
   size_t _menuSize;

   bool   _withSeparator;

   _ELENA_::List<text_c*> _list;

   int getIndex(text_t item);
   bool erase(text_t item);
   void eraseLast();

public:
   void assign(Menu* menu)
   {
      _menu = menu;
   }

   text_t get(int id);
   void add(text_t item);

   void refresh();

   void clear();

   MenuHistoryList(int maxCount, int menuBaseId, bool withSeparator);
};

} // _GUI_

#endif // menulistH
