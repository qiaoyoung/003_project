import os
import json
import shutil
import re

def ensure_scale_suffix(original_filename, base_name, scale):
    """确保文件名具有正确的@2x或@3x后缀，并保持原始扩展名"""
    # 获取原始文件的扩展名
    _, ext = os.path.splitext(original_filename)
    # 如果没有扩展名，默认使用.png
    if not ext:
        ext = '.png'
    
    # 移除base_name中可能存在的@2x或@3x后缀
    base_name = re.sub(r'@[23]x$', '', base_name)
    
    # 如果是1x，不添加后缀
    if scale == '1':
        return f"{base_name}{ext}"
    return f"{base_name}@{scale}x{ext}"

def process_imagesets(xcassets_path):
    # 获取Images.xcassets的父目录，在这里创建Image文件夹
    xcassets_parent = os.path.dirname(os.path.dirname(xcassets_path))  # 上升两级到Business目录
    image_dir = os.path.join(xcassets_parent, 'Image')
    os.makedirs(image_dir, exist_ok=True)
    
    # 递归遍历所有目录
    for root, dirs, files in os.walk(xcassets_path):
        # 处理当前目录下的所有.imageset文件夹
        for dir_name in dirs:
            if dir_name.endswith('.imageset'):
                imageset_path = os.path.join(root, dir_name)
                contents_json_path = os.path.join(imageset_path, 'Contents.json')
                
                if os.path.exists(contents_json_path):
                    # 读取Contents.json
                    with open(contents_json_path, 'r', encoding='utf-8') as f:
                        contents = json.load(f)
                    
                    base_name = dir_name[:-9]  # 移除.imageset后缀
                    modified = False
                    
                    # 处理图片文件
                    for image in contents['images']:
                        if 'filename' in image:
                            old_filename = image['filename']
                            scale = image['scale']
                            new_filename = ensure_scale_suffix(old_filename, base_name, scale[0])
                            
                            # 如果文件名需要更改
                            if old_filename != new_filename:
                                old_path = os.path.join(imageset_path, old_filename)
                                new_path = os.path.join(imageset_path, new_filename)
                                
                                if os.path.exists(old_path):
                                    os.rename(old_path, new_path)
                                    image['filename'] = new_filename
                                    modified = True
                    
                    # 如果有修改，更新Contents.json
                    if modified:
                        with open(contents_json_path, 'w', encoding='utf-8') as f:
                            json.dump(contents, f, indent=2)
                    
                    # 直接复制到Image文件夹，不保持目录结构
                    dest_imageset = os.path.join(image_dir, dir_name)
                    if os.path.exists(dest_imageset):
                        shutil.rmtree(dest_imageset)
                    shutil.copytree(imageset_path, dest_imageset)

def main():
    # 使用绝对路径，指向Images.xcassets目录
    xcassets_path = '/Users/qiaoyang/Desktop/003_project/codeResource/AppleProject/AppleProject/Images.xcassets'
    
    if not os.path.exists(xcassets_path):
        print(f"错误: 找不到目录 {xcassets_path}")
        return
    
    try:
        process_imagesets(xcassets_path)
        print("处理完成！图片已重命名并复制到Image文件夹。")
    except Exception as e:
        print(f"处理过程中出现错误: {str(e)}")

if __name__ == '__main__':
    main() 
