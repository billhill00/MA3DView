#ifndef WLZXM_H
#define WLZXM_H
#if defined(__GNUC__)
#ident "University of Edinburgh $Id$"
#else
static char _WlzXm_h[] = "University of Edinburgh $Id$";
#endif
/*!
* \file         WlzXm.h
* \author	Richard Baldock
* \date         April 2003
* \version      $Id$
* \par
* Address:
*               MRC Human Genetics Unit,
*               MRC Institute of Genetics and Molecular Medicine,
*               University of Edinburgh,
*               Western General Hospital,
*               Edinburgh, EH4 2XU, UK.
* \par
* Copyright (C), [2012],
* The University Court of the University of Edinburgh,
* Old College, Edinburgh, UK.
* 
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be
* useful but WITHOUT ANY WARRANTY; without even the implied
* warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
* PURPOSE.  See the GNU General Public License for more
* details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the Free
* Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA  02110-1301, USA.
* \brief
* \ingroup	MA3DView
*/

typedef struct _WlzXmFileListCallbackStruct{
  String	file;
  WlzEffFormat	format;
} WlzXmFileListCallbackStruct;

/* hold all type and prototypes for now */
extern Widget WlzXmCreateExtFFObjectFSB(
  Widget	parent,
  String	name,
  XtCallbackProc	proc,
  XtPointer		client_data);

extern WlzObject *WlzXmReadExtFFObject(
  Widget				dialog,
  XmFileSelectionBoxCallbackStruct	*cbs,
  WlzEffFormat				*dstFmt,
  WlzErrorNum				*dstErr);

extern WlzErrorNum WlzXmWriteExtFFObject(
  WlzObject				*obj,
  Widget				dialog,
  XmFileSelectionBoxCallbackStruct	*cbs,
  WlzEffFormat				*dstFmt);

extern WlzErrorNum WlzXmExtFFObjectFSBSetType(
  Widget	dialog,
  WlzEffFormat	format);

extern WlzEffFormat WlzXmExtFFObjectFSBGetType(
  Widget	dialog,
  WlzErrorNum	*dstErr);

/* do not add anything after this line */
#endif /* WLZXM_H */
