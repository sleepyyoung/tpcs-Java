package tpcs.service;


import com.github.pagehelper.PageInfo;
import tpcs.pojo.File;
import tpcs.pojo.Result;

import java.util.List;

public interface IFileService {
    /** 获取文件列表 */
    PageInfo<File> selectFileListByUserId(Integer userId, Integer pageNum, Integer pageSize);

    /** 获取文件列表 */
    PageInfo<File> selectFileList(Integer pageNum, Integer pageSize);

    /** 通过文件id获取文件信息 */
    File selectFileById(Integer id);

    /** 添加文件信息 */
    Boolean addFile(File file);

    /** 删除文件 */
    Result deleteFile(Integer id);

    /** 批量删除文件 */
    Result batchDelete(List<Integer> ids);
}
