//
//  FilterController.swift
//  WBDB3
//
//  Created by Taylor Carr on 10/14/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import CoreGraphics
import MultiSlider
import SwiftUI
import UIKit

// MARK: Gloabl Variables

var locations: [UIView: Int] = [:]
var points: [CGPoint] = []
var maxPoints = 360

struct Global {
    var locations: [UIView: Int] = [:]

    func getCirclePoints(centerPoint point: CGPoint, radius: CGFloat, n: Int) -> [CGPoint] {
        let result: [CGPoint] = stride(from: 0, to: maxPoints, by: maxPoints / n).map {
            let bearing = CGFloat($0) * .pi / CGFloat(maxPoints / 2)
            let x = (point.x - 80) + radius * cos(bearing)
            let y = (point.y - 50) + radius * sin(bearing)
            return CGPoint(x: x, y: y)
        }

        return result
    }
}

// MARK: Filter VC

class FilterController: UIViewController {
    @IBAction func selectRegion(_: UITapGestureRecognizer) {
        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToRegion()
        }, completion: nil)
    }

    @IBAction func selectChannel(_: UITapGestureRecognizer) {
        UIView.transition(with: channelsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func selectGenre(_: UITapGestureRecognizer) {
        UIView.transition(with: genresView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToGenre()
        }, completion: nil)
    }

    // MARK: Pan Gesture Recognizers

    // Region Pan Gestures
    @IBAction func USPan(_ sender: UIPanGestureRecognizer) {
        // let vel: CGPoint = sender.velocity
        let velocity = sender.velocity(in: sender.view)
        let translation = sender.translation(in: sender.view)

        print("Velocity \(velocity)")
        print("Translation \(translation)")

//        if (velocity.x > 0 && sender.view!.layer.position.y >= Region.layer.position.y) {
//            let num: Int = Int(velocity.y)/300
//            for _ in 0...num {
        ////                UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
        ////                    self.rotateRegions()
        ////                })
//                rotateRegions()
//
//
//            }
//        }
//        else if (velocity.x > 0 && sender.view!.layer.position.y <= Region.layer.position.y) {
//            let num: Int = Int(velocity.y)/300
//                        for _ in 0...num {
//            //                UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
//            //                    self.rotateRegions()
//            //                })
//                            rotateRegionsCounter()
//
//
//                        }
//        }
//        else if (velocity.x < 0 && sender.view!.layer.position.y <= Region.layer.position.y) {
//            let num: Int = Int(velocity.y)/300
//            for _ in 0...num {
//            //                UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
//            //                    self.rotateRegions()
//            //                })
//                rotateRegions()
//            }
//        }
//        else if (velocity.x < 0 && sender.view!.layer.position.y >= Region.layer.position.y) {
//            let num: Int = Int(velocity.y)/300
//            for _ in 0...num {
//            //                UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
//            //                    self.rotateRegions()
//            //                })
//                rotateRegionsCounter()
//            }
//        }
//        else if (velocity.x < 0 && velocity.y > 0) {
//            rotateRegionsCounter()
//        }
//        else if (velocity.x > 0 && velocity.y > 0) {
//            rotateRegionsCounter()
//        }

//        // Q1
//        // sender.view +-
//        // only allow x > 0 && y < 0
//        //            x < 0 && y < 0
//        //
//        if ((sender.view?.layer.position.x)! >= Region.layer.position.x && (sender.view?.layer.position.y)! <= Region.layer.position.y) {
//            if (velocity.x > 0 && velocity.y > 0) {
//                print("R1 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegions()
//            }
//            else if (velocity.x < 0 && velocity.y < 0) {
//                print("L1 \(translation) \(sender.view?.layer.position) \(Region.layer.position) \(locations[US])")
//                rotateRegionsCounter()
//            }
//        }
//
//        // Q2
//        // sender.view ++
//        // only allow x < 0 && y < 0
//        //            x > 0 && y > 0
//        else if ((sender.view?.layer.position.x)! > Region.layer.position.x && (sender.view?.layer.position.y)! > Region.layer.position.y) {
//            if (translation.x < 0 && translation.y > 0) {
//                print("R2 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegions()
//            }
//            else if (translation.x >= 0 && translation.y < 0) {
//                print("L2 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegionsCounter()
//            }
//        }
//
//        // Q3
//        // sender.view -+
//        // only allow x < 0 && y > 0
//        //            x > 0 && y < 0
//        else if ((sender.view!.layer.position.x) <= Region.frame.origin.x && (sender.view!.layer.position.y) >= Region.frame.origin.y) {
//            print("TRUE")
//            print("TRUE")
//            print("TRUE")
//            print("TRUE")
//            print("TRUE")
//
//            if (velocity.x < 0 && velocity.y < 0) {
//                print("R3 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegions()
//            }
//            else if (velocity.x > 0 && velocity.y > 0) {
//                print("L3 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegionsCounter()
//            }
//        }
//
//        // Q4
//        // sender.view --
//        // only allow x > 0 && y > 0
//        //            x < 0 && y < 0
//        else if ((sender.view?.layer.position.x)! <= Region.frame.origin.x && (sender.view?.layer.position.y)! <= Region.frame.origin.y) {
//            if (velocity.x < 0 && velocity.y < 0) {
//                print("R4 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegions()
//            }
//            else if (velocity.x <= 0 && velocity.y > 0) {
//                print("L4 \(translation) \(sender.view?.layer.position) \(Region.layer.position)")
//                rotateRegionsCounter()
//            }
//        }

        // print(translation)
        // clockwise
//        if (translation.x > 0 && translation.y > 0) {
//            // ++
//            rotateRegions()
//        }
//        else if (translation.x < 0 && translation.y > 0) { //counter-clockwise
//            // ++
//            rotateRegions()
//        }
//        else if (translation.x < 0 && translation.y < 0) { //counter-clockwise
//            // --
//            //print(velocity)
//            //rotateRegionsCounter()
//        }
//        else if (translation.x > 0 && translation.y > 0) { //counter-clockwise
//            //--
//            //print(velocity)
//            //rotateRegionsCounter()
//        }

        rotateRegions()
    }

    @IBAction func EUPan(_: UIPanGestureRecognizer) {
        rotateRegions()
    }

    @IBAction func SAPan(_: UIPanGestureRecognizer) {
        rotateRegions()
    }

    @IBAction func CAPan(_: UIPanGestureRecognizer) {
        rotateRegions()
    }

    @IBAction func AsiaPan(_: UIPanGestureRecognizer) {
        rotateRegions()
    }

    @IBAction func OceanicPan(_: UIPanGestureRecognizer) {
        rotateRegions()
    }

    // Channel Pan Gesture Recognizers
    @IBAction func PPVPan(_: UIPanGestureRecognizer) {
        rotateChannels()
    }

    @IBAction func premiumPan(_: UIPanGestureRecognizer) {
        rotateChannels()
    }

    @IBAction func publicPan(_: UIPanGestureRecognizer) {
        rotateChannels()
    }

    @IBAction func onDemandPan(_: UIPanGestureRecognizer) {
        rotateChannels()
    }

    // Genre Pan Gesture Recognizers
    @IBAction func allGenresPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func actionPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func comedyPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func dramaPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func horrorPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func scifiPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    @IBAction func thrillerPan(_: UIPanGestureRecognizer) {
        rotateGenres()
    }

    // MARK: Views and Labels

    @IBOutlet var SA: UIView!
    @IBOutlet var territory4Label: UILabel!
    @IBOutlet var CA: UIView!
    @IBOutlet var territory3Label: UILabel!
    @IBOutlet var Asia: UIView!
    @IBOutlet var territory5Label: UILabel!
    @IBOutlet var EU: UIView!
    @IBOutlet var territory2Label: UILabel!
    @IBOutlet var Region: UIView!
    @IBOutlet var Oceanic: UIView!
    @IBOutlet var territory6Label: UILabel!
    @IBOutlet var US: UIView!
    @IBOutlet var territory1Label: UILabel!
    @IBOutlet var regionsView: UIView!
    @IBOutlet var channelsView: UIView!
    @IBOutlet var mediaSelectionLabel: UILabel!
    @IBOutlet var genresView: UIView!
    @IBOutlet var selectionsView: UIStackView!

    @IBOutlet var regionSelection: UIView!
    @IBOutlet var regionSelectionLabel: UILabel!
    @IBOutlet var channelSelection: UIView!
    @IBOutlet var genreSelection: UIView!
    @IBOutlet var genreSelectionLabel: UILabel!
    @IBOutlet var timeFrameSlider: MultiSlider!
    @IBAction func nextButton(_: UIButton) {
        if genreSelectionLabel.text != "GENRE" {
            performSegue(withIdentifier: "showLoadingScreen", sender: Any.self)
        }
    }

    @IBOutlet var nextButtonOutlet: UIButton!

    // Region Selected
    @IBAction func USSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor
        })

        regionSelectionLabel.text = territory1Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func USLongPress(_ sender: UILongPressGestureRecognizer) {
        let popoverFrame = CGRect(origin: view.frame.origin, size: CGSize(width: 250, height: 50))
        let popoverVC = UIViewController()
        let popoverView = UIView(frame: popoverFrame)
        let label = UILabel(frame: popoverFrame)
        label.text = "FRENCH COMROM"
        label.center = popoverView.center
        label.textAlignment = .center
        label.numberOfLines = 0
        popoverView.addSubview(label)
        popoverVC.view.addSubview(popoverView)
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 250, height: 50)

        // Specify the anchor point for the popover.
        popoverVC.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        popoverVC.popoverPresentationController?.sourceView = sender.view
        popoverVC.popoverPresentationController?.sourceRect = popoverView.bounds

        // Present the view controller (in a popover).
        present(popoverVC, animated: true) // The popover is visible.

        if sender.state == UILongPressGestureRecognizer.State.ended {
            dismiss(animated: true, completion: {})
        }
    }

    @IBAction func EUSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor

        })

        regionSelectionLabel.text = territory2Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func EULongPress(_ sender: UILongPressGestureRecognizer) {
        let popoverFrame = CGRect(origin: view.frame.origin, size: CGSize(width: 250, height: 50))
        let popoverVC = UIViewController()
        let popoverView = UIView(frame: popoverFrame)
        let label = UILabel(frame: popoverFrame)
        label.text = "GERMAN SPEAKING \nEUROPE"
        label.center = popoverView.center
        label.textAlignment = .center
        label.numberOfLines = 0
        popoverView.addSubview(label)
        popoverVC.view.addSubview(popoverView)
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 250, height: 50)

        // Specify the anchor point for the popover.
        popoverVC.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        popoverVC.popoverPresentationController?.sourceView = sender.view
        popoverVC.popoverPresentationController?.sourceRect = popoverView.bounds

        // Present the view controller (in a popover).
        present(popoverVC, animated: true) // The popover is visible.

        if sender.state == UILongPressGestureRecognizer.State.ended {
            dismiss(animated: true, completion: {})
        }
    }

    @IBAction func SASelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor

        })

        regionSelectionLabel.text = territory4Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func OceanicSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor

        })

        regionSelectionLabel.text = territory6Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func CASelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor

        })

        regionSelectionLabel.text = territory3Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    @IBAction func CALongPress(_ sender: UILongPressGestureRecognizer) {
        let popoverFrame = CGRect(origin: view.frame.origin, size: CGSize(width: 250, height: 50))
        let popoverVC = UIViewController()
        let popoverView = UIView(frame: popoverFrame)
        let label = UILabel(frame: popoverFrame)
        label.text = "LATIN AMERICA"
        label.center = popoverView.center
        label.textAlignment = .center
        label.numberOfLines = 0
        popoverView.addSubview(label)
        popoverVC.view.addSubview(popoverView)
        popoverVC.modalPresentationStyle = .popover
        popoverVC.preferredContentSize = CGSize(width: 250, height: 50)

        // Specify the anchor point for the popover.
        popoverVC.popoverPresentationController?.delegate = self as? UIPopoverPresentationControllerDelegate
        popoverVC.popoverPresentationController?.sourceView = sender.view
        popoverVC.popoverPresentationController?.sourceRect = popoverView.bounds

        // Present the view controller (in a popover).
        present(popoverVC, animated: true) // The popover is visible.

        if sender.state == UILongPressGestureRecognizer.State.ended {
            dismiss(animated: true, completion: {})
        }
    }

    @IBAction func AsiaSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.regionSelection.backgroundColor = sender.view?.backgroundColor
            self.regionSelection.layer.shadowColor = sender.view?.layer.shadowColor

        })

        regionSelectionLabel.text = territory5Label.text
        regionSelectionLabel.textColor = .white

        UIView.transition(with: regionsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToChannel()
        }, completion: nil)
    }

    // MARK: MEDIA

    @IBOutlet var PPV: UIView!
    @IBOutlet var media1Label: UILabel!
    @IBOutlet var Premium: UIView!
    @IBOutlet var media2Label: UILabel!
    @IBOutlet var Public: UIView!
    @IBOutlet var media3Label: UILabel!
    @IBOutlet var onDemand: UIView!
    @IBOutlet var media4Label: UILabel!
    @IBOutlet var Distribution: UIView!

    // Channel Selected
    @IBAction func PPVSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.channelSelection.backgroundColor = sender.view?.backgroundColor
            self.channelSelection.layer.shadowColor = sender.view?.layer.shadowColor
        })

        mediaSelectionLabel.text = media1Label.text
        mediaSelectionLabel.textColor = .white

        UIView.transition(with: channelsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToGenre()
        }, completion: nil)
    }

    @IBAction func premiumSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.channelSelection.backgroundColor = sender.view?.backgroundColor
            self.channelSelection.layer.shadowColor = sender.view?.layer.shadowColor
        })

        mediaSelectionLabel.text = media2Label.text
        mediaSelectionLabel.textColor = .white

        UIView.transition(with: channelsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToGenre()
        }, completion: nil)
    }

    @IBAction func publicSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.channelSelection.backgroundColor = sender.view?.backgroundColor
            self.channelSelection.layer.shadowColor = sender.view?.layer.shadowColor
        })

        mediaSelectionLabel.text = media3Label.text
        mediaSelectionLabel.textColor = .white

        UIView.transition(with: channelsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToGenre()
        }, completion: nil)
    }

    @IBAction func onDemandSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.channelSelection.backgroundColor = sender.view?.backgroundColor
            self.channelSelection.layer.shadowColor = sender.view?.layer.shadowColor
        })

        mediaSelectionLabel.text = media4Label.text
        mediaSelectionLabel.textColor = .white

        UIView.transition(with: channelsView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.changeToGenre()
        }, completion: nil)
    }

    // MARK: GENRES

    @IBOutlet var action: UIView!
    @IBOutlet var genre1Label: UILabel!
    @IBOutlet var comedy: UIView!
    @IBOutlet var genre2Label: UILabel!
    @IBOutlet var drama: UIView!
    @IBOutlet var genre3Label: UILabel!
    @IBOutlet var horror: UIView!
    @IBOutlet var genre4Label: UILabel!
    @IBOutlet var genres: UIView!
    @IBOutlet var allGenres: UIView!
    @IBOutlet var genre0Label: UILabel!
    @IBOutlet var thriller: UIView!
    @IBOutlet var genre5Label: UILabel!
    @IBOutlet var scifi: UIView!
    @IBOutlet var genre6Label: UILabel!

    @IBAction func allGenresSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre0Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in
            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func actionSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre1Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in
            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func comedySelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre2Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in
            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.isUserInteractionEnabled = true
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func dramaSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre3Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in

            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func horrorSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre4Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in

            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func scifiSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre6Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in

            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    @IBAction func thrillerSelected(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.genreSelectionLabel.text = self.genre5Label.text
            self.genreSelectionLabel.textColor = .white
            self.genreSelection.backgroundColor = sender.view?.backgroundColor
            self.genreSelection.layer.shadowColor = sender.view?.layer.shadowColor
        }, completion: { (_: Bool) in
            self.nextButtonOutlet.isUserInteractionEnabled = true
            self.nextButtonOutlet.alpha = 1.0
            self.nextButtonOutlet.layer.backgroundColor = UIColor(named: "wbblue")?.cgColor

            UIView.animate(withDuration: 0.75,
                           delay: 0,
                           options: [.curveEaseInOut,
                                     .autoreverse,
                                     .repeat,
                                     .allowUserInteraction],
                           animations: {
                               // UIView.setAnimationRepeatCount(1.5)
                               self.nextButtonOutlet.layer.backgroundColor = UIColor.systemTeal.cgColor

                           })
        })
    }

    // MARK: ChangeToRegion()

    func changeToRegion() {
        points = Global().getCirclePoints(centerPoint: CGPoint(x: regionsView.bounds.width / 2, y: regionsView.bounds.height / 2), radius: 300, n: maxPoints)

        channelsView.isHidden = true
        genresView.isHidden = true

        let w = regionsView.bounds.width
        let h = regionsView.bounds.height

        regionsView.addSubview(US)
        regionsView.addSubview(EU)
        regionsView.addSubview(CA)
        regionsView.addSubview(SA)
        regionsView.addSubview(Asia)
        regionsView.addSubview(Oceanic)
        regionsView.addSubview(Region)

        US.layer.zPosition = 0
        EU.layer.zPosition = 0
        CA.layer.zPosition = 0
        SA.layer.zPosition = 0
        Asia.layer.zPosition = 0
        Oceanic.layer.zPosition = 0

        Region.layer.cornerRadius = 75
        regionSelection.layer.cornerRadius = 50

        US.frame.origin = points[0]
        EU.frame.origin = points[60]
        CA.frame.origin = points[120]
        SA.frame.origin = points[180]
        Asia.frame.origin = points[240]
        Oceanic.frame.origin = points[300]

        locations[US] = 0
        locations[EU] = 60
        locations[CA] = 120
        locations[SA] = 180
        locations[Asia] = 240
        locations[Oceanic] = 300

        Region.frame.origin = CGPoint(x: w / 2 - (genres.frame.width / 2), y: h / 2 - (genres.frame.height / 2))

        US.layer.shadowOffset = .zero
        US.layer.shadowColor = UIColor.systemTeal.cgColor
        US.layer.shadowRadius = 20
        US.layer.shadowOpacity = 0.3
        US.layer.shadowPath = UIBezierPath(rect: US.bounds).cgPath
        US.layer.cornerRadius = 60

        EU.layer.shadowOffset = .zero
        EU.layer.shadowColor = UIColor.systemTeal.cgColor
        EU.layer.shadowRadius = 20
        EU.layer.shadowOpacity = 0.3
        EU.layer.shadowPath = UIBezierPath(rect: EU.bounds).cgPath
        EU.layer.cornerRadius = 60

        CA.layer.shadowOffset = .zero
        CA.layer.shadowColor = UIColor.systemTeal.cgColor
        CA.layer.shadowRadius = 20
        CA.layer.shadowOpacity = 0.3
        CA.layer.shadowPath = UIBezierPath(rect: CA.bounds).cgPath
        CA.layer.cornerRadius = 60

        SA.layer.shadowColor = UIColor.systemTeal.cgColor
        SA.layer.shadowRadius = 20
        SA.layer.shadowOpacity = 0.3
        SA.layer.shadowPath = UIBezierPath(rect: SA.bounds).cgPath
        SA.layer.cornerRadius = 60

        Asia.layer.shadowColor = UIColor.systemTeal.cgColor
        Asia.layer.shadowRadius = 20
        Asia.layer.shadowOpacity = 0.3
        Asia.layer.shadowPath = UIBezierPath(rect: Asia.bounds).cgPath
        Asia.layer.cornerRadius = 60

        Oceanic.layer.shadowColor = UIColor.systemTeal.cgColor
        Oceanic.layer.shadowRadius = 20
        Oceanic.layer.shadowOpacity = 0.3
        Oceanic.layer.shadowPath = UIBezierPath(rect: Oceanic.bounds).cgPath
        Oceanic.layer.cornerRadius = 60

        regionsView.isHidden = false
    }

    // MARK: ChangeToChannel()

    func changeToChannel() {
        points = Global().getCirclePoints(centerPoint: CGPoint(x: channelsView.bounds.width / 2, y: channelsView.bounds.height / 2), radius: 300, n: maxPoints)

        regionsView.isHidden = true
        genresView.isHidden = true

        let w = channelsView.bounds.width
        let h = channelsView.bounds.height

        PPV.layer.shadowOffset = .zero
        PPV.layer.shadowColor = UIColor.systemTeal.cgColor
        PPV.layer.shadowRadius = 20
        PPV.layer.shadowOpacity = 0.3
        PPV.layer.shadowPath = UIBezierPath(rect: PPV.bounds).cgPath

        Premium.layer.shadowOffset = .zero
        Premium.layer.shadowColor = UIColor.systemTeal.cgColor
        Premium.layer.shadowRadius = 20
        Premium.layer.shadowOpacity = 0.3
        Premium.layer.shadowPath = UIBezierPath(rect: Premium.bounds).cgPath

        Public.layer.shadowOffset = .zero
        Public.layer.shadowColor = UIColor.systemTeal.cgColor
        Public.layer.shadowRadius = 20
        Public.layer.shadowOpacity = 0.3
        Public.layer.shadowPath = UIBezierPath(rect: Public.bounds).cgPath

        onDemand.layer.shadowOffset = .zero
        onDemand.layer.shadowColor = UIColor.systemTeal.cgColor
        onDemand.layer.shadowRadius = 20
        onDemand.layer.shadowOpacity = 0.3
        onDemand.layer.shadowPath = UIBezierPath(rect: onDemand.bounds).cgPath

        Distribution.layer.cornerRadius = 75
        PPV.layer.cornerRadius = 60
        Premium.layer.cornerRadius = 60
        Public.layer.cornerRadius = 60
        onDemand.layer.cornerRadius = 60

        PPV.frame.origin = points[45]
        Premium.frame.origin = points[135]
        Public.frame.origin = points[225]
        onDemand.frame.origin = points[315]

        locations[PPV] = 45 // 0
        locations[Premium] = 135 // 90
        locations[Public] = 225 // 180
        locations[onDemand] = 315 // 270

        Distribution.frame.origin = CGPoint(x: w / 2 - (Distribution.frame.width / 2), y: h / 2 - (Distribution.frame.height / 2))

        channelsView.isHidden = false
    }

    // MARK: ChangeToGenre()

    func changeToGenre() {
        nextButtonOutlet.isUserInteractionEnabled = false
        nextButtonOutlet.layer.backgroundColor = UIColor.systemGray.cgColor

        nextButtonOutlet.alpha = 0.25
        nextButtonOutlet.layer.cornerRadius = 20
        nextButtonOutlet.setTitleColor(UIColor.systemGray, for: .disabled)

        points = Global().getCirclePoints(centerPoint: CGPoint(x: genresView.bounds.width / 2, y: genresView.bounds.height / 2), radius: 300, n: maxPoints)

        regionsView.isHidden = true
        channelsView.isHidden = true

        let w = genresView.bounds.width
        let h = genresView.bounds.height

        action.layer.shadowOffset = .zero
        action.layer.shadowColor = UIColor.systemTeal.cgColor
        action.layer.shadowRadius = 20
        action.layer.shadowOpacity = 0.3
        action.layer.shadowPath = UIBezierPath(rect: action.bounds).cgPath

        comedy.layer.shadowOffset = .zero
        comedy.layer.shadowColor = UIColor.systemTeal.cgColor
        comedy.layer.shadowRadius = 20
        comedy.layer.shadowOpacity = 0.3
        comedy.layer.shadowPath = UIBezierPath(rect: comedy.bounds).cgPath

        drama.layer.shadowOffset = .zero
        drama.layer.shadowColor = UIColor.systemTeal.cgColor
        drama.layer.shadowRadius = 20
        drama.layer.shadowOpacity = 0.3
        drama.layer.shadowPath = UIBezierPath(rect: drama.bounds).cgPath

        horror.layer.shadowOffset = .zero
        horror.layer.shadowColor = UIColor.systemTeal.cgColor
        horror.layer.shadowRadius = 20
        horror.layer.shadowOpacity = 0.3
        horror.layer.shadowPath = UIBezierPath(rect: horror.bounds).cgPath

        allGenres.layer.shadowOffset = .zero
        allGenres.layer.shadowColor = UIColor.systemTeal.cgColor
        allGenres.layer.shadowRadius = 20
        allGenres.layer.shadowOpacity = 0.3
        allGenres.layer.shadowPath = UIBezierPath(rect: allGenres.bounds).cgPath

        thriller.layer.shadowOffset = .zero
        thriller.layer.shadowColor = UIColor.systemTeal.cgColor
        thriller.layer.shadowRadius = 20
        thriller.layer.shadowOpacity = 0.3
        thriller.layer.shadowPath = UIBezierPath(rect: thriller.bounds).cgPath

        scifi.layer.shadowOffset = .zero
        scifi.layer.shadowColor = UIColor.systemTeal.cgColor
        scifi.layer.shadowRadius = 20
        scifi.layer.shadowOpacity = 0.3
        scifi.layer.shadowPath = UIBezierPath(rect: scifi.bounds).cgPath

        genres.layer.cornerRadius = 75
        action.layer.cornerRadius = 60
        comedy.layer.cornerRadius = 60
        drama.layer.cornerRadius = 60
        horror.layer.cornerRadius = 60
        allGenres.layer.cornerRadius = 60
        thriller.layer.cornerRadius = 60
        scifi.layer.cornerRadius = 60

        allGenres.frame.origin = points[0]
        action.frame.origin = points[51]
        comedy.frame.origin = points[102]
        drama.frame.origin = points[153]
        horror.frame.origin = points[204]
        scifi.frame.origin = points[255]
        thriller.frame.origin = points[306]

        locations[allGenres] = 0
        locations[action] = 51
        locations[comedy] = 102
        locations[drama] = 153
        locations[horror] = 204
        locations[scifi] = 255
        locations[thriller] = 306

        genres.frame.origin = CGPoint(x: w / 2 - (genres.frame.width / 2), y: h / 2 - (genres.frame.height / 2))

        genresView.isHidden = false
    }

    // MARK: - ViewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

//        let headerText = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
//        headerText.text = "WARNER BROS."
//        headerText.font = UIFont(name: "GillSans-Bold", size: CGFloat(25))
//        headerText.textColor = UIColor(named: "wbblue")!
//        navigationItem.titleView = headerText
        navigationController?.isNavigationBarHidden = true
        navigationController?.title = "RIGHTS AVAILABILITY"

        // selectionsView.backgroundColor = .clear

        regionSelection.layer.shadowOffset = .zero
        regionSelection.layer.shadowColor = UIColor.clear.cgColor
        regionSelection.layer.shadowRadius = 20
        regionSelection.layer.shadowOpacity = 0.3
        // regionSelection.layer.shadowPath = UIBezierPath(rect: regionSelection.bounds).cgPath

        channelSelection.layer.shadowOffset = .zero
        channelSelection.layer.shadowColor = UIColor.clear.cgColor
        channelSelection.layer.shadowRadius = 20
        channelSelection.layer.shadowOpacity = 0.3
        // channelSelection.layer.shadowPath = UIBezierPath(rect: channelSelection.bounds).cgPath

        genreSelection.layer.shadowOffset = .zero
        genreSelection.layer.shadowColor = UIColor.clear.cgColor
        genreSelection.layer.shadowRadius = 20
        genreSelection.layer.shadowOpacity = 0.3
        // genreSelection.layer.shadowPath = UIBezierPath(rect: genreSelection.bounds).cgPath

        regionSelection.layer.cornerRadius = 50
        channelSelection.layer.cornerRadius = 50
        genreSelection.layer.cornerRadius = 50
        changeToRegion()

        // Credit to https://github.com/yonat/MultiSlider
        timeFrameSlider.minimumValue = 2020 // default is 0.0
        timeFrameSlider.maximumValue = 2055 // default is 1.0

        timeFrameSlider.value = [2020, 2055]
        timeFrameSlider.orientation = .horizontal
        timeFrameSlider.outerTrackColor = .lightGray
        timeFrameSlider.valueLabelPosition = .bottom // .notAnAttribute = don't show labels
        timeFrameSlider.isValueLabelRelative = false // show differences between thumbs instead of absolute values
        timeFrameSlider.hasRoundTrackEnds = true
        timeFrameSlider.snapStepSize = 1.0
    }

    override func viewSafeAreaInsetsDidChange() {
        regionSelection.frame.origin.y = view.safeAreaInsets.top + 10

        channelSelection.frame.origin.y = view.safeAreaInsets.top + 10

        genreSelection.frame.origin.y = view.safeAreaInsets.top + 10

        // selectionsView.frame.origin.y = view.safeAreaInsets.top
    }

    // Lock to portrait view
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return false
    }

    @objc func sliderChanged(slider: MultiSlider) {
        print("\(slider.value)") // e.g., [1.0, 4.5, 5.0]
    }

    func getCirclePoints(centerPoint point: CGPoint, radius: CGFloat, n: Int) -> [CGPoint] {
        let result: [CGPoint] = stride(from: 0, to: maxPoints, by: maxPoints / n).map {
            let bearing = CGFloat($0) * .pi / CGFloat(maxPoints / 2)
            let x = point.x + radius * cos(bearing)
            let y = point.y + radius * sin(bearing)
            return CGPoint(x: x, y: y)
        }
        return result
    }

    // MARK: Rotate Functions()

    func rotateRegions() {
        var currentLoc = locations[US]
        var currentLoc2 = locations[EU]
        var currentLoc3 = locations[CA]
        var currentLoc4 = locations[SA]
        var currentLoc5 = locations[Asia]
        var currentLoc6 = locations[Oceanic]

        if currentLoc == maxPoints - 1 {
            currentLoc = 0
        } else if currentLoc2 == maxPoints - 1 {
            currentLoc2 = 0
        } else if currentLoc3 == maxPoints - 1 {
            currentLoc3 = 0
        } else if currentLoc4 == maxPoints - 1 {
            currentLoc4 = 0
        } else if currentLoc5 == maxPoints - 1 {
            currentLoc5 = 0
        } else if currentLoc6 == maxPoints - 1 {
            currentLoc6 = 0
        }

        locations[US] = currentLoc! + 1
        locations[EU] = currentLoc2! + 1
        locations[CA] = currentLoc3! + 1
        locations[SA] = currentLoc4! + 1
        locations[Asia] = currentLoc5! + 1
        locations[Oceanic] = currentLoc6! + 1

        UIView.animate(withDuration: 0.0001, delay: 0, options: [.curveLinear, .autoreverse], animations: {
            self.US.frame.origin = points[locations[self.US]!]
            self.EU.frame.origin = points[locations[self.EU]!]
            self.CA.frame.origin = points[locations[self.CA]!]
            self.SA.frame.origin = points[locations[self.SA]!]
            self.Asia.frame.origin = points[locations[self.Asia]!]
            self.Oceanic.frame.origin = points[locations[self.Oceanic]!]
        })
    }

    func rotateRegionsCounter() {
        var currentLoc = locations[US]
        var currentLoc2 = locations[EU]
        var currentLoc3 = locations[CA]
        var currentLoc4 = locations[SA]
        var currentLoc5 = locations[Asia]
        var currentLoc6 = locations[Oceanic]

        if currentLoc == 0 {
            currentLoc = maxPoints - 1
        } else if currentLoc2 == 0 {
            currentLoc2 = maxPoints - 1
        } else if currentLoc3 == 0 {
            currentLoc3 = maxPoints - 1
        } else if currentLoc4 == 0 {
            currentLoc4 = maxPoints - 1
        } else if currentLoc5 == 0 {
            currentLoc5 = maxPoints - 1
        } else if currentLoc6 == 0 {
            currentLoc6 = maxPoints - 1
        }

        locations[US] = currentLoc! - 1
        locations[EU] = currentLoc2! - 1
        locations[CA] = currentLoc3! - 1
        locations[SA] = currentLoc4! - 1
        locations[Asia] = currentLoc5! - 1
        locations[Oceanic] = currentLoc6! - 1

//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear, .autoreverse], animations: {
//            self.US.frame.origin = points[locations[self.US]!]
//            self.EU.frame.origin = points[locations[self.EU]!]
//            self.CA.frame.origin = points[locations[self.CA]!]
//            self.SA.frame.origin = points[locations[self.SA]!]
//            self.Asia.frame.origin = points[locations[self.Asia]!]
//            self.Oceanic.frame.origin = points[locations[self.Oceanic]!]
//        })

        US.frame.origin = points[locations[US]!]
        EU.frame.origin = points[locations[EU]!]
        CA.frame.origin = points[locations[CA]!]
        SA.frame.origin = points[locations[SA]!]
        Asia.frame.origin = points[locations[Asia]!]
        Oceanic.frame.origin = points[locations[Oceanic]!]
    }

    func rotateChannels() {
        var currentLoc = locations[PPV]
        var currentLoc2 = locations[Premium]
        var currentLoc3 = locations[Public]
        var currentLoc4 = locations[onDemand]

        if currentLoc == maxPoints - 1 {
            currentLoc = 0
        } else if currentLoc2 == maxPoints - 1 {
            currentLoc2 = 0
        } else if currentLoc3 == maxPoints - 1 {
            currentLoc3 = 0
        } else if currentLoc4 == maxPoints - 1 {
            currentLoc4 = 0
        }

        locations[PPV] = currentLoc! + 1
        locations[Premium] = currentLoc2! + 1
        locations[Public] = currentLoc3! + 1
        locations[onDemand] = currentLoc4! + 1

        PPV.frame.origin = points[locations[PPV]!]
        Premium.frame.origin = points[locations[Premium]!]
        Public.frame.origin = points[locations[Public]!]
        onDemand.frame.origin = points[locations[onDemand]!]
    }

    func rotateGenres() {
        var currentLoc0 = locations[allGenres]
        var currentLoc1 = locations[action]
        var currentLoc2 = locations[comedy]
        var currentLoc3 = locations[drama]
        var currentLoc4 = locations[horror]
        var currentLoc5 = locations[scifi]
        var currentLoc6 = locations[thriller]

        if currentLoc0 == maxPoints - 1 {
            currentLoc0 = 0
        } else if currentLoc1 == maxPoints - 1 {
            currentLoc1 = 0
        } else if currentLoc2 == maxPoints - 1 {
            currentLoc2 = 0
        } else if currentLoc3 == maxPoints - 1 {
            currentLoc3 = 0
        } else if currentLoc4 == maxPoints - 1 {
            currentLoc4 = 0
        } else if currentLoc5 == maxPoints - 1 {
            currentLoc5 = 0
        } else if currentLoc6 == maxPoints - 1 {
            currentLoc6 = 0
        }

        locations[allGenres] = currentLoc0! + 1
        locations[action] = currentLoc1! + 1
        locations[comedy] = currentLoc2! + 1
        locations[drama] = currentLoc3! + 1
        locations[horror] = currentLoc4! + 1
        locations[scifi] = currentLoc5! + 1
        locations[thriller] = currentLoc6! + 1

        allGenres.frame.origin = points[locations[allGenres]!]
        action.frame.origin = points[locations[action]!]
        comedy.frame.origin = points[locations[comedy]!]
        drama.frame.origin = points[locations[drama]!]
        horror.frame.origin = points[locations[horror]!]
        scifi.frame.origin = points[locations[scifi]!]
        thriller.frame.origin = points[locations[thriller]!]
    }

    override func willTransition(to _: UITraitCollection,
                                 with _: UIViewControllerTransitionCoordinator) {}
}
