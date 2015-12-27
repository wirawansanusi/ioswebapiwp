//
//  GLOBAL_VALUES.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/19/15.
//  Copyright © 2015 Protogres. All rights reserved.
//

import UIKit

struct GLOBAL_VALUES {
    
    // List of all available API URL
    struct FETCH {
        
        struct CATEGORIES {
            
            static func URL() -> NSURL {
                
                return NSURL(string: "http://www.areahp.com/api/get_category_index/")!
            }
        }
        
        struct PRODUCTS {
            
            static func URL(categoryId: Int) -> NSURL {
                
                return NSURL(string: "http://www.areahp.com/api/get_category_posts/?id=\(categoryId)/")!
            }
        }
        
        struct PRODUCT {
            
            static func URL(postId: Int) -> NSURL {
                
                return NSURL(string: "http://areahp.com/api/get_post/?id=\(postId)")!
            }
        }
    }
    
    // List of all colors
    struct COLOR {
        
        static let PRIMARY = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        static let DEFAULT = UIColor.groupTableViewBackgroundColor()
        static let WARNING = UIColor.redColor()
        static let WHITE = UIColor.whiteColor()
    }
    
    // List of all available Contacts
    struct CONTACT {
        
        struct INTRO {
            
            static let TEXT = "Selamat datang di areahp.com ! Kami menjual berbagai aksesoris dan perlengkapan untuk Gadget (Notebook ,Tablet dan Smartphone) dengan jangkauan pengiriman ke seluruh pelosok Indonesia dengan menggunakan jasa pengiriman kilat. Berbekalkan pengalaman di bidang gadget selama bertahun-tahun, kami menghadirkan kepada Anda produk-produk inovatif dengan harga yang terjangkau."
        }
        
        struct DIRECTION {
            
            static let URL = NSURL(string: "whatsapp://send?abid=+6285780070729")!
            static let TITLE = "Tunjukkan arah dari posisi sekarang"
            static let IMAGE = UIImage(named: "Direction")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi WhatsApp sudah terinstall terlebih dahulu."
            }
        }
        
        struct STORE {
            
            static let URL = NSURL(string: "tel://+6285777118989")!
            static let TITLE = "085-777-11-8989"
            static let IMAGE = UIImage(named: "Phone")!
            
            struct ALERT {
                
                static let TITLE = "Call AreaHP"
                static let MESSAGE = "Apakah anda yakin ingin menghubungi AreaHP? \n(+62)85-777-11-8989"
                static let IMAGE = UIImage(named: "Contact")!
            }
        }
        
        struct BBM {
            
            static let URL = NSURL(string: "pin://2B683755")!
            static let TITLE = "BBM PIN 2B683755"
            static let IMAGE = UIImage(named: "BBM")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi BBM sudah terinstall terlebih dahulu."
            }
        }
        
        struct EMAIL {
            
            static let URL = NSURL(string: "mailto:areahp77@yahoo.com")!
            static let TITLE = "EMAIL areahp77@yahoo.com"
            static let IMAGE = UIImage(named: "Email")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi email sudah terinstall terlebih dahulu."
            }
        }
        
        struct EMAIL2 {
            
            static let URL = NSURL(string: "mailto:areahp77@ymail.com")!
            static let TITLE = "EMAIL areahp77@ymail.com"
            static let IMAGE = UIImage(named: "Email")!
            
            struct ALERT {
                
                static let TITLE = "Tidak dapat membuka aplikasi"
                static let MESSAGE = "Pastikan aplikasi email sudah terinstall terlebih dahulu."
            }
        }
    }
}
