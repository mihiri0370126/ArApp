//
//  TopViewController.swift
//  ar_app
//
//  Created by 岸本蓮 on 2020/11/05.
//

import UIKit
import MapKit
import CoreLocation

class TopViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var d: UITabBarItem!
    var con1Cnt:Int = 0
    var locationManager: CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        d.badgeValue = "test"
        // ロケーションマネージャーのセットアップ
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager!.requestWhenInUseAuthorization()

        // 位置情報の更新
        locationManager.startUpdatingLocation()
        
        print(mapView.userLocation.coordinate.latitude)

        //3D表示
        mapView.isPitchEnabled = true
        //スクロール拒否
        mapView.isScrollEnabled = false
        //回転拒否
        mapView.isRotateEnabled = true
        
        // ビルを3Dに見えるようにする.
        mapView.showsBuildings = true
        
    }

    //Private許可
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            // 許可されてない場合
            case .notDetermined:
                // 許可を求める
                manager.requestWhenInUseAuthorization()
            // 拒否されてる場合
            case .restricted, .denied:
                // 何もしない
                break
            // 許可されている場合
            case .authorizedAlways, .authorizedWhenInUse:
                // 現在地の取得を開始
                manager.startUpdatingLocation()
                break
            default:
                break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {

            // 現在地を拡大して表示する
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.region = region
            // 3D Camera
            //カメラの角度(ピッチを調整すると最初から３D表示される)
            let mapCamera = MKMapCamera()
            mapCamera.centerCoordinate = coordinate
            mapCamera.centerCoordinateDistance = 1000
            mapCamera.pitch = 45
            self.mapView.camera = mapCamera
            
            //ピンの作成
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            mapView.addAnnotation(pin)
        }
    }
    
    //addAnnotationした際に呼ばれるデリゲートメソッド
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

            let testPinView = MKPinAnnotationView()
            testPinView.pinTintColor = UIColor.blue
            return testPinView
        }
    func doSomeAction(){
        d.badgeValue = "change"
    }
}

