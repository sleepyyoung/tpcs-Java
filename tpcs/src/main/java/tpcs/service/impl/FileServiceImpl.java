package tpcs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import tpcs.dao.FileMapper;
import tpcs.pojo.File;
import tpcs.pojo.Result;
import tpcs.service.IFileService;

import java.util.List;

@Service
public class FileServiceImpl implements IFileService {
    private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);

    @Value("${upload.path}")
    private String uploadPath;
    @Value("${spring.profiles.active}")
    private String env;
    @Autowired
    private FileMapper fileMapper;

    /** 获取文件列表 */
    @Override
    public PageInfo<File> selectFileListByUserId(Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<File> fileList = fileMapper.selectFileListByUserId(userId);
        return new PageInfo<>(fileList);
    }

    /** 获取文件列表 */
    @Override
    public PageInfo<File> selectFileList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<File> fileList = fileMapper.selectFileList();
        return new PageInfo<>(fileList);
    }

    /** 通过文件id获取文件信息 */
    @Override
    public File selectFileById(Integer id) {
        return fileMapper.selectFileById(id);
    }

    /** 添加文件信息 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean addFile(File file) {
        return fileMapper.addFile(file);
    }

    /** 删除文件信息 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result deleteFile(Integer id) {
        boolean success;
        String msg = null;
        Object savePoint = null;
        try {
            File file = fileMapper.selectFileById(id);
            success = fileMapper.deleteFile(id);
            savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
            if (success) {
                boolean delete;
                if ("test".equals(env)) {
                    delete = new java.io.File(uploadPath + "/" + file.getTruthName()).delete();
                } else {
                    delete = new java.io.File(uploadPath + "\\" + file.getTruthName()).delete();
                }
                if (!delete) {
                    throw new Exception(file + " 物理删除失败！");
                }
            } else {
                throw new Exception(file + " 从数据库中删除失败！");
            }
        } catch (Exception e) {
            success = false;
            msg = "文件删除失败，请稍后再试！";
            logger.error("文件删除失败，原因：" + e.getMessage());
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
        }
        return new Result(success, msg);
    }

    /** 批量删除文件信息 */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Result batchDelete(List<Integer> ids) {
        boolean success;
        String msg = null;
        try {
            success = fileMapper.batchDelete(ids) == ids.size();
        } catch (Exception e) {
            success = false;
            msg = e.getMessage();
            logger.error("批量删除文件信息失败，原因：" + e.getMessage());
        }
        return new Result(success, msg);
    }
}
