/* ***** BEGIN LICENSE BLOCK *****
* Version: MPL 1.1/GPL 2.0/LGPL 2.1
*
* The contents of this file are subject to the Mozilla Public License Version
* 1.1 (the "License"); you may not use this file except in compliance with
* the License. You may obtain a copy of the License at
* http://www.mozilla.org/MPL/
*
* Software distributed under the License is distributed on an "AS IS" basis,
* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
* for the specific language governing rights and limitations under the
* License.
*
* The Original Code is part of Oviyam, an web viewer for DICOM(TM) images
* hosted at http://skshospital.net/pacs/webviewer/oviyam_0.6-src.zip
*
* The Initial Developer of the Original Code is
* Raster Images
* Portions created by the Initial Developer are Copyright (C) 2007
* the Initial Developer. All Rights Reserved.
*
* Contributor(s):
* Babu Hussain A
* Meer Asgar Hussain B
* Prakash J
* Suresh V
*
* Alternatively, the contents of this file may be used under the terms of
* either the GNU General Public License Version 2 or later (the "GPL"), or
* the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
* in which case the provisions of the GPL or the LGPL are applicable instead
* of those above. If you wish to allow use of your version of this file only
* under the terms of either the GPL or the LGPL, and not to allow others to
* use your version of this file under the terms of the MPL, indicate your
* decision by deleting the provisions above and replace them with the notice
* and other provisions required by the GPL or the LGPL. If you do not delete
* the provisions above, a recipient may use your version of this file under
* the terms of any one of the MPL, the GPL or the LGPL.
*
* ***** END LICENSE BLOCK ***** */

package in.raster.oviyam.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.raster.oviyam.xml.handler.IOviyamCxtHandler;

public class IOviyamContext extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iOviyamCxt = request.getParameter("iOviyamCxt");
        String toDo = request.getParameter("action");
    	response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            File tempDir = (File) getServletContext().getAttribute("javax.servlet.context.tempdir");
            
            String warName = request.getContextPath().substring(1);
            String tmpDirPath = tempDir.getAbsolutePath();
            tmpDirPath = tmpDirPath.substring(0, tmpDirPath.indexOf(warName));
            IOviyamCxtHandler cxtHandler = new IOviyamCxtHandler(tmpDirPath);
            
            if(toDo == null || toDo.length() == 0) {
            	String IOCxt = cxtHandler.getContext();
            	out.println(IOCxt);
            } else if(toDo.equalsIgnoreCase("Update")) {
            	cxtHandler.updateContext(iOviyamCxt);
            	out.println("success");
            }
        } catch(Exception e) {
            e.printStackTrace();
        } 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
