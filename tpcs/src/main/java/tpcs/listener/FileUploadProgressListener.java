package tpcs.listener;

import org.apache.commons.fileupload.ProgressListener;
import org.springframework.stereotype.Component;
import tpcs.pojo.UploadStatus;

import javax.servlet.http.HttpSession;

@Component
public class FileUploadProgressListener implements ProgressListener {
    private HttpSession session;

    public void setSession(HttpSession session) {
        this.session = session;
        UploadStatus uploadStatus = new UploadStatus();
        session.setAttribute("upload_status", uploadStatus);
    }

    @Override
    public void update(long bytesRead, long contentLength, int items) {
        // TODO Auto-generated method stub
        UploadStatus uploadStatus = (UploadStatus) session.getAttribute("upload_status");
        uploadStatus.setBytesRead(bytesRead);
        uploadStatus.setContentLength(contentLength);
        uploadStatus.setItems(items);
        uploadStatus.setUseTime(System.currentTimeMillis() - uploadStatus.getStartTime());
        uploadStatus.setPercent((int) (100 * bytesRead / contentLength));
        session.setAttribute("upload_status", uploadStatus);
    }
}
