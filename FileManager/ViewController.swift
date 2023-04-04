//
//  ViewController.swift
//  FileManager
//
//  Created by BH on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    let fileManager = FileManager.default
    var directoryURL: URL?
    var fileURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createDirectory(_ sender: UIButton) {
        
        // 폴더 경로 지정
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        directoryURL = documentsURL.appendingPathComponent("peppo_folder")
        
        // 폴더 추가
        do {
            try fileManager.createDirectory(at: directoryURL!, withIntermediateDirectories: false)
            print("폴더 생성 완료")
            
        } catch let error {
            print("Create folder error: \(error.localizedDescription)")
        }
    }
    
    @IBAction func createFile(_ sender: UIButton) {
        
        // 파일 경로 설정 & 확장자 설정
        // 파일 생성
        fileURL = directoryURL?.appendingPathComponent("peppo.txt")
        print("파일 생성 완료")
        let text = "😛"
        
        do {
            try text.write(to: fileURL!, atomically: false, encoding: .utf8)
            
        } catch let error {
            print("Create file error: \(error.localizedDescription)")
        }
    }
    
    // 파일삭제
    @IBAction func deleteButton(_ sender: UIButton) {
        guard let fileURL = fileURL else {
            print("Nothing to delete")
            return
        }
        
        do {
            try fileManager.removeItem(at: fileURL)
            print("파일 삭제 완료")
            
        } catch let error {
            print("Failed to delete file: \(error.localizedDescription)")
        }
        
    }
    
}

