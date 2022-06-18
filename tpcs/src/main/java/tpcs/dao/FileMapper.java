package tpcs.dao;

import org.apache.ibatis.annotations.*;
import tpcs.pojo.File;

import java.util.List;

@Mapper
public interface FileMapper {
    /** 获取文件列表 */
    @Select("select ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE from file_info where USER_ID = #{userId}")
    @Result(column = "GMT_CREATE", property = "gmtCreate")
    @Result(column = "USER_ID", property = "userId")
    @Result(column = "FILE_NAME", property = "fileName")
    @Result(column = "TRUTH_NAME", property = "truthName")
    List<File> selectFileListByUserId(Integer userId);

    /** 获取文件列表 */
    @Select("select ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE from file_info")
    @Result(column = "GMT_CREATE", property = "gmtCreate")
    @Result(column = "USER_ID", property = "userId")
    @Result(column = "FILE_NAME", property = "fileName")
    @Result(column = "TRUTH_NAME", property = "truthName")
    List<File> selectFileList();

    /** 通过文件id获取文件信息 */
    @Select("select ID, USER_ID, FILE_NAME, TRUTH_NAME, GMT_CREATE from file_info where ID = #{id}")
    @Result(column = "GMT_CREATE", property = "gmtCreate")
    @Result(column = "USER_ID", property = "userId")
    @Result(column = "FILE_NAME", property = "fileName")
    @Result(column = "TRUTH_NAME", property = "truthName")
    File selectFileById(Integer id);

    /** 添加文件信息 */
    @Insert("insert into file_info(USER_ID, FILE_NAME, TRUTH_NAME) value (#{userId}, #{fileName}, #{truthName})")
    @Result(column = "FILE_NAME", property = "fileName")
    @Result(column = "TRUTH_NAME", property = "truthName")
    Boolean addFile(File file);

    /** 删除文件信息 */
    @Delete("delete from file_info where ID = #{id}")
    Boolean deleteFile(Integer id);

    /** 批量删除文件信息 */
    Integer batchDelete(List<Integer> ids);
}
